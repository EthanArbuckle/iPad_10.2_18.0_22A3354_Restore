@implementation THIRDPartyApps

- (NSString)processName
{
  return self->processName;
}

- (void)setProcessName:(id)a3
{
  objc_storeStrong((id *)&self->processName, a3);
}

- (int)wifiIn
{
  return self->wifiIn;
}

- (void)setWifiIn:(int)a3
{
  self->wifiIn = a3;
}

- (int)wifiOut
{
  return self->wifiOut;
}

- (void)setWifiOut:(int)a3
{
  self->wifiOut = a3;
}

- (int)cellIn
{
  return self->cellIn;
}

- (void)setCellIn:(int)a3
{
  self->cellIn = a3;
}

- (int)cellOut
{
  return self->cellOut;
}

- (void)setCellOut:(int)a3
{
  self->cellOut = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->processName, 0);
}

@end
