@implementation PUIImageEncoder(PBFUtilities)

+ (id)pbf_imageEncoderForPath:()PBFUtilities definition:configuredProperties:context:
{
  void *v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v24[2];
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v9 = (void *)MEMORY[0x1E0C99E98];
  v10 = a6;
  objc_msgSend(v9, "pbf_snapshotURLForPath:definition:configuredProperties:context:", a3, a4, a5, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pbf_scale");
  v13 = v12;
  objc_msgSend(v10, "pbf_referenceBounds");
  v15 = v14;
  v17 = v16;

  objc_msgSend(MEMORY[0x1E0D7FCE0], "defaultFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = *MEMORY[0x1E0D7FDA8];
  v24[0] = v13 * v15;
  v24[1] = v13 * v17;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v24, "{CGSize=dd}");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "formatByAppendingDestinationOptions:addImageOptions:", MEMORY[0x1E0C9AA70], v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FCD8]), "initWithURL:format:", v11, v21);
  return v22;
}

@end
