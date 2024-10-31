
data{
     int F;
     int Y;
}
parameters{
     real<lower=0,upper=1> p;
}
model{
    p ~ uniform( 0 , 1 );
    Y ~ binomial( Y + F , p );
}

