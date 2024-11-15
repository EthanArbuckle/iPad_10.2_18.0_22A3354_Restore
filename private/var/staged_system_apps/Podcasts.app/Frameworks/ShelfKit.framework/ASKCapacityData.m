@implementation ASKCapacityData

- (ASKCapacityData)init
{
  ASKCapacityData *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _UNKNOWN **v6;
  uint64_t v7;
  void *v8;
  _UNKNOWN **v9;
  uint64_t v10;
  void *v11;
  _UNKNOWN **v12;
  uint64_t v13;
  void *v14;
  _UNKNOWN **v15;
  uint64_t v16;
  void *v17;
  _UNKNOWN **v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)ASKCapacityData;
  v2 = -[ASKCapacityData init](&v20, "init");
  if (v2)
  {
    v3 = (void *)MGCopyAnswer(CFSTR("DiskUsage"), 0);
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", kMGQDiskUsageTotalSystemCapacity));
    v5 = (void *)v4;
    if (v4)
      v6 = (_UNKNOWN **)v4;
    else
      v6 = &off_391D08;
    -[ASKCapacityData setTotalSystemCapacity:](v2, "setTotalSystemCapacity:", v6);
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", kMGQDiskUsageTotalSystemAvailable));
    v8 = (void *)v7;
    if (v7)
      v9 = (_UNKNOWN **)v7;
    else
      v9 = &off_391D08;
    -[ASKCapacityData setTotalSystemAvailable:](v2, "setTotalSystemAvailable:", v9);
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", kMGQDiskUsageTotalDataCapacity));
    v11 = (void *)v10;
    if (v10)
      v12 = (_UNKNOWN **)v10;
    else
      v12 = &off_391D08;
    -[ASKCapacityData setTotalDataCapacity:](v2, "setTotalDataCapacity:", v12);
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", kMGQDiskUsageTotalDataAvailable));
    v14 = (void *)v13;
    if (v13)
      v15 = (_UNKNOWN **)v13;
    else
      v15 = &off_391D08;
    -[ASKCapacityData setTotalDataAvailable:](v2, "setTotalDataAvailable:", v15);
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", kMGQDiskUsageTotalDiskCapacity));
    v17 = (void *)v16;
    if (v16)
      v18 = (_UNKNOWN **)v16;
    else
      v18 = &off_391D20;
    -[ASKCapacityData setTotalDiskCapacity:](v2, "setTotalDiskCapacity:", v18);

  }
  return v2;
}

- (NSNumber)totalSystemCapacity
{
  return self->_totalSystemCapacity;
}

- (void)setTotalSystemCapacity:(id)a3
{
  objc_storeStrong((id *)&self->_totalSystemCapacity, a3);
}

- (NSNumber)totalSystemAvailable
{
  return self->_totalSystemAvailable;
}

- (void)setTotalSystemAvailable:(id)a3
{
  objc_storeStrong((id *)&self->_totalSystemAvailable, a3);
}

- (NSNumber)totalDataCapacity
{
  return self->_totalDataCapacity;
}

- (void)setTotalDataCapacity:(id)a3
{
  objc_storeStrong((id *)&self->_totalDataCapacity, a3);
}

- (NSNumber)totalDataAvailable
{
  return self->_totalDataAvailable;
}

- (void)setTotalDataAvailable:(id)a3
{
  objc_storeStrong((id *)&self->_totalDataAvailable, a3);
}

- (NSNumber)totalDiskCapacity
{
  return self->_totalDiskCapacity;
}

- (void)setTotalDiskCapacity:(id)a3
{
  objc_storeStrong((id *)&self->_totalDiskCapacity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalDiskCapacity, 0);
  objc_storeStrong((id *)&self->_totalDataAvailable, 0);
  objc_storeStrong((id *)&self->_totalDataCapacity, 0);
  objc_storeStrong((id *)&self->_totalSystemAvailable, 0);
  objc_storeStrong((id *)&self->_totalSystemCapacity, 0);
}

@end
