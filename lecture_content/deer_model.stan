
data{
  int N;
  vector[N] buck;
  vector[N] doe;
  
} parameters {
  real beta0;
  real beta1;
  real<lower=0, upper=50> sigma;
  
} model {
  
  vector[N] mu;
  beta0 ~ normal(129, 10);
  beta1 ~ normal(0, 5);
  sigma ~ uniform(0, 50);
  
  for(i in 1:N){
    mu[i] = beta0 + beta1*doe[i];
  }

  buck ~ normal(mu, sigma);
}

