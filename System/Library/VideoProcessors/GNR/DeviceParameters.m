@implementation DeviceParameters

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->fusion, 0);
  objc_storeStrong((id *)&self->nmHighGain, 0);
  objc_storeStrong((id *)&self->nm, 0);
}

@end
