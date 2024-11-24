T=5;
plot(0:0.02:0.2,greeniums(1,:)*10000,'+-')
hold on 
plot(0:0.02:0.2,greeniums(2,:)*10000,'O-')
xlabel("\lambda_I")
ylabel("Greenium/bps")
grid on
legend("bid greenium","ask greenium")

plot(0:0.02:0.2,(1000./prices(1,:)).^(1/T)*10000-10000,'o-')
hold on
plot(0:0.02:0.2,(1000./prices(2,:)).^(1/T)*10000-10000,'+-')

grid on
xlabel("\lambda_I")
ylabel("yield/bps")
legend("bid","ask")

%lambdaC
plot(0:0.2:2,greeniums(1,:)*10000,'+-')
hold on 
plot(0:0.2:2,greeniums(2,:)*10000,'O-')
xlabel("\lambda_C")
ylabel("Greenium/bps")
grid on
legend("bid greenium","ask greenium")

plot(0:0.2:2,(1000./prices(1,:)).^(1/T)*10000-10000,'o-')
hold on
plot(0:0.2:2,(1000./prices(2,:)).^(1/T)*10000-10000,'+-')
%plot(0:0.2:2,(1000./prices(3,:)).^(1/T)*10000-10000,'ro-')
%plot(0:0.2:2,(1000./prices(4,:)).^(1/T)*10000-10000,'r+-')
grid on
xlabel("\lambda_C")
ylabel("yield/bps")
legend("bid","ask")

%lambdaCshort
plot(0:0.2:1,greeniums(1,1:6)*10000,'+-')
hold on 
plot(0:0.2:1,greeniums(2,1:6)*10000,'O-')
xlabel("\lambda_C")
ylabel("Greenium/bps")
grid on
legend("bid greenium","ask greenium")

plot(0:0.2:1,(1000./prices(1,1:6)).^(1/T)*10000-10000,'o-')
hold on
plot(0:0.2:1,(1000./prices(2,1:6)).^(1/T)*10000-10000,'+-')
%plot(0:0.2:2,(1000./prices(3,:)).^(1/T)*10000-10000,'ro-')
%plot(0:0.2:2,(1000./prices(4,:)).^(1/T)*10000-10000,'r+-')
grid on
xlabel("\lambda_C")
ylabel("yield/bps")
legend("bid","ask")


%beta
plot(0:0.002:0.02,greeniums(1,:)*10000,'+-')
hold on 
plot(0:0.002:0.02,greeniums(2,:)*10000,'O-')
xlabel("\beta/\gamma")
ylabel("Greenium/bps")
grid on
legend("bid greenium","ask greenium")

plot(0:0.002:0.02,(1000./prices(1,:)).^(1/T)*10000-10000,'o-')
hold on
plot(0:0.002:0.02,(1000./prices(2,:)).^(1/T)*10000-10000,'+-')
grid on
xlabel("\beta/\gamma")
ylabel("yield/bps")
legend("bid","ask")