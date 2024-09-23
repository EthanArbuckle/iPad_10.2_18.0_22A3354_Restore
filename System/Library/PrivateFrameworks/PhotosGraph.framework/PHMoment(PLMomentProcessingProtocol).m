@implementation PHMoment(PLMomentProcessingProtocol)

- (double)pl_coordinate
{
  void *v1;
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "pl_location");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "coordinate");
    v4 = v3;
  }
  else
  {
    v4 = *MEMORY[0x1E0C9E500];
  }

  return v4;
}

@end
