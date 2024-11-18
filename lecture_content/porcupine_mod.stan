data{
	int N; // Number of data points
	int P; // Number of random effects
    vector[N] weight_lb;
    array[N] int week;
    array[N] int individual_id;
}
parameters{
     real beta0;
     vector[P] alpha_z; // Notice we define alpha on the z-scale
     real beta1;
     real<lower=0> sigma_individual;
     real<lower=0> sigma;
}
transformed parameters {

	// Transform back to get alpha
	vector[P] alpha;
	for(i in 1:6){
		alpha[i] = sigma_individual*alpha_z[i];
	}

}
model{
    vector[N] mu;
    sigma ~ exponential( 1 );
    sigma_individual ~ exponential( 1 );
    beta1 ~ normal( 0 , 3 );
    alpha_z ~ normal( 0 , 1); // A standard normal on the z-scale...easy to sample!
    beta0 ~ normal( 4 , 3 );
    for ( i in 1:N ) {
        mu[i] = beta0 + alpha[individual_id[i]] + beta1 * week[i];
    }
    weight_lb ~ normal( mu , sigma );
}
