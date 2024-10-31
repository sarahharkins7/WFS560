
data{
     int N;
     vector[N] area;
     vector[N] svl;
     vector[N] density;
     vector[N] nutr;
     vector[N] algae;
}
parameters{
     real beta0;
     real beta1;
     real beta2;
     real beta3;
     real<lower=0> sigma;
}
model{

    vector[25] mu;
    sigma ~ exponential( 1 );
    beta0 ~ normal( 0 , 5 );
    beta1 ~ normal( 0 , 3 );
    beta2 ~ normal( 0 , 3 );
    beta3 ~ normal( 0 , 3 );
    for ( i in 1:N ) {
        mu[i] = beta0 + beta1 * algae[i] + beta2 * nutr[i] + beta3 * density[i];
    }
    svl ~ normal( mu , sigma );
}

