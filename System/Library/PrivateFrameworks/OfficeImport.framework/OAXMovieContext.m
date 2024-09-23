@implementation OAXMovieContext

- (BOOL)loadDelayedNode:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v4;
  else
    v6 = 0;
  if (!self->super.mTargetLocation || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[OCPPackage partForLocation:](self->super.mPackage, "partForLocation:", self->super.mTargetLocation);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v12;
      v11 = v12 != 0;
      if (v12)
      {
        objc_msgSend(v12, "data");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setData:", v13);

      }
    }
    else
    {
      if (!v6)
        goto LABEL_21;
      -[OCPPackage partForLocation:](self->super.mPackage, "partForLocation:", self->super.mTargetLocation);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v14;
      v11 = v14 != 0;
      if (v14)
      {
        objc_msgSend(v14, "data");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setSoundData:", v15);

      }
    }
    -[OCPPackage resetPartForLocation:](self->super.mPackage, "resetPartForLocation:", self->super.mTargetLocation);
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL path](self->super.mTargetLocation, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "fileExistsAtPath:", v8);

  if (!v9)
  {
LABEL_21:
    v11 = 0;
    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", self->super.mTargetLocation);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setData:", v10);
  v11 = 1;
LABEL_16:

LABEL_22:
  return v11;
}

- (id)dataRep
{
  OCPPackage *mPackage;
  NSURL *mTargetLocation;
  void *v5;
  OISFUFileDataRepresentation *v6;
  void *v7;
  void *v8;
  int v9;
  OISFUFileDataRepresentation *v10;

  mPackage = self->super.mPackage;
  mTargetLocation = self->super.mTargetLocation;
  if (mPackage)
  {
    -[OCPPackage partForLocation:](mPackage, "partForLocation:", mTargetLocation);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "zipEntry");
      v6 = (OISFUFileDataRepresentation *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    -[OCPPackage resetPartForLocation:](self->super.mPackage, "resetPartForLocation:", self->super.mTargetLocation);
  }
  else
  {
    if (!mTargetLocation
      || (objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          -[NSURL path](self->super.mTargetLocation, "path"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v7, "fileExistsAtPath:", v8),
          v8,
          v7,
          !v9))
    {
      v6 = 0;
      return v6;
    }
    v10 = [OISFUFileDataRepresentation alloc];
    -[NSURL path](self->super.mTargetLocation, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[OISFUFileDataRepresentation initWithPath:](v10, "initWithPath:", v5);
  }

  return v6;
}

@end
