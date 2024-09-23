@implementation GTFileWriterSession

+ (id)sessionWithFileEntries:(id)a3 relativeToURL:(id)a4 options:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  __objc2_class **v13;
  id v14;
  void *v15;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = objc_msgSend(v9, "compressionAlgorithm");
  v13 = &off_100030158;
  if (v12)
    v13 = off_100030150;
  v14 = objc_msgSend((id)objc_opt_class(*v13), "sessionWithFileEntries:relativeToURL:options:error:", v11, v10, v9, a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  return v15;
}

@end
