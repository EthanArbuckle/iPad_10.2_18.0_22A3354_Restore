@implementation PVFaceprint

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PVFaceprint;
  v4 = -[PVObject copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "_setPropertiesFrom:", self);
  return v4;
}

- (void)_setPropertiesFrom:(id)a3
{
  id v4;
  NSData *v5;
  NSData *faceprintData;
  id v7;

  v4 = a3;
  self->_faceprintVersion = objc_msgSend(v4, "faceprintVersion");
  objc_msgSend(v4, "faceprintData");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v5 = (NSData *)objc_msgSend(v7, "copy");
  faceprintData = self->_faceprintData;
  self->_faceprintData = v5;

}

- (BOOL)getDistance:(float *)a3 toOtherFaceprint:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  int64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  BOOL v20;
  int v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  const __CFString *v32;
  uint64_t v33;
  const __CFString *v34;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = v8;
  if (a5)
  {
    if (v8)
      goto LABEL_3;
LABEL_13:
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v35 = *MEMORY[0x1E0CB2D50];
    v36[0] = CFSTR("Cannot get distance between faceprints. Missing faceprint.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    v24 = -1010;
LABEL_15:
    objc_msgSend(v23, "errorForPhotoVisionErrorCode:userInfo:", v24, v11);
    v20 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  v30 = 0;
  a5 = (id *)&v30;
  if (!v8)
    goto LABEL_13;
LABEL_3:
  v10 = -[PVFaceprint faceprintVersion](self, "faceprintVersion");
  if (v10 != objc_msgSend(v9, "faceprintVersion"))
  {
    v25 = (void *)MEMORY[0x1E0CB35C8];
    v33 = *MEMORY[0x1E0CB2D50];
    v34 = CFSTR("Cannot get distance between faceprints with mismatched versions.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v25;
    v24 = -1011;
    goto LABEL_15;
  }
  -[PVFaceprint faceprintData](self, "faceprintData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "faceprintData");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v11 && v12)
  {
    v29 = 0;
    +[PVUtils faceprintFromFaceprintArchive:error:](PVUtils, "faceprintFromFaceprintArchive:error:", v11, &v29);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v29;
    if (v14)
    {
      v28 = v15;
      +[PVUtils faceprintFromFaceprintArchive:error:](PVUtils, "faceprintFromFaceprintArchive:error:", v13, &v28);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v28;

      if (v16)
      {
        objc_msgSend(v14, "computeDistance:withDistanceFunction:error:", v16, 0, a5);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        v20 = v18 != 0;
        if (a3 && v18)
        {
          objc_msgSend(v18, "floatValue");
          *(_DWORD *)a3 = v21;
        }

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorForPhotoVisionErrorCode:localizedDescription:underlyingError:", -1010, CFSTR("Cannot get distance between faceprints. Missing faceprint."), v17);
        v20 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorForPhotoVisionErrorCode:localizedDescription:underlyingError:", -1010, CFSTR("Cannot get distance between faceprints. Missing faceprint."), v15);
      v20 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      v17 = v15;
    }

  }
  else
  {
    v26 = (void *)MEMORY[0x1E0CB35C8];
    v31 = *MEMORY[0x1E0CB2D50];
    v32 = CFSTR("Cannot get distance between faceprints. Missing faceprint data.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "errorForPhotoVisionErrorCode:userInfo:", -1010, v17);
    v20 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_22:
  return v20;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v7.receiver = self;
  v7.super_class = (Class)PVFaceprint;
  -[PVObject description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendFormat:", CFSTR("  faceprintVersion       : %ld\n"), self->_faceprintVersion);
  objc_msgSend(v5, "appendFormat:", CFSTR("  faceprintData          : <%p> [length: %ld]\n"), self->_faceprintData, -[NSData length](self->_faceprintData, "length"));
  return v5;
}

- (int64_t)faceprintVersion
{
  return self->_faceprintVersion;
}

- (void)setFaceprintVersion:(int64_t)a3
{
  self->_faceprintVersion = a3;
}

- (NSData)faceprintData
{
  return self->_faceprintData;
}

- (void)setFaceprintData:(id)a3
{
  objc_storeStrong((id *)&self->_faceprintData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceprintData, 0);
}

+ (id)faceprintWithFaceprintData:(id)a3 faceprintVersion:(int64_t)a4
{
  id v6;
  void *v7;

  if (a3)
  {
    v6 = a3;
    v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLocalIdentifier:", 0);
    objc_msgSend(v7, "setFaceprintData:", v6);

    objc_msgSend(v7, "setFaceprintVersion:", a4);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

@end
