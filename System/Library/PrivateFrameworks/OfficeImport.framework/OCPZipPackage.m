@implementation OCPZipPackage

- (OCPZipPackage)initWithData:(id)a3
{
  id v4;
  OISFUZipArchive *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *mParts;
  OCPZipPackage *v8;

  v4 = a3;
  v5 = -[OISFUZipArchive initWithData:collapseCommonRootDirectory:]([OISFUZipArchive alloc], "initWithData:collapseCommonRootDirectory:", v4, 0);
  v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  mParts = self->mParts;
  self->mParts = v6;

  v8 = -[OCPZipPackage initWithArchive:](self, "initWithArchive:", v5);
  return v8;
}

- (OCPZipPackage)initWithArchive:(id)a3
{
  OISFUZipArchive **p_mArchive;
  void *v6;
  void *v7;
  xmlDoc *v8;
  void *v9;
  void *v10;
  xmlDoc *v11;
  void *v12;
  void *v13;
  xmlDoc *v14;
  void *v15;
  xmlDoc *v16;
  OCPZipPackage *v17;
  void *v19;
  id v20;

  v20 = a3;
  p_mArchive = &self->mArchive;
  objc_storeStrong((id *)&self->mArchive, a3);
  objc_msgSend(CFSTR("."), "stringByAppendingString:", CFSTR("rels"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("_rels"), "stringByAppendingPathComponent:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[OISFUZipArchive entryWithName:](self->mArchive, "entryWithName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    +[OCPException raise:format:](OCPException, "raise:format:", CFSTR("OCPZipPackageError"), CFSTR("No package relationships"));
  v8 = (xmlDoc *)objc_msgSend(v7, "xmlDocument");
  -[OISFUZipArchive entryWithName:](*p_mArchive, "entryWithName:", CFSTR("docProps/core.xml"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    v11 = (xmlDoc *)objc_msgSend(v9, "xmlDocument");
  else
    v11 = 0;
  -[OISFUZipArchive entryWithName:](*p_mArchive, "entryWithName:", CFSTR("docProps/app.xml"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
    v14 = (xmlDoc *)objc_msgSend(v12, "xmlDocument");
  else
    v14 = 0;
  -[OISFUZipArchive entryWithName:](*p_mArchive, "entryWithName:", CFSTR("[Content_Types].xml"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
    +[OCPException raise:format:](OCPException, "raise:format:", CFSTR("OCPZipPackageError"), CFSTR("No package content types"));
  v16 = (xmlDoc *)objc_msgSend(v15, "xmlDocument");

  v17 = -[OCPPackage initWithRelationshipsXml:corePropertiesXml:appPropertiesXml:contentTypesXml:](self, "initWithRelationshipsXml:corePropertiesXml:appPropertiesXml:contentTypesXml:", v8, v11, v14, v16);
  if (v8)
    xmlFreeDoc(v8);
  if (v11)
    xmlFreeDoc(v11);
  if (v14)
    xmlFreeDoc(v14);
  if (v16)
    xmlFreeDoc(v16);

  return v17;
}

- (id)partForLocation:(id)a3
{
  id v4;
  OCPZipPackagePart *v5;
  void *v6;
  OCPZipPackagePart *v7;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->mParts, "objectForKey:", v4);
  v5 = (OCPZipPackagePart *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if (objc_msgSend(v4, "isInternalToPackage"))
    {
      objc_msgSend(v4, "path");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isAbsolutePath") && (unint64_t)objc_msgSend(v6, "length") >= 2)
      {
        v5 = -[OCPZipPackagePart initWithArchive:location:package:]([OCPZipPackagePart alloc], "initWithArchive:location:package:", self->mArchive, v4, self);

        if (v5)
        {
LABEL_9:
          -[NSMutableDictionary setObject:forKey:](self->mParts, "setObject:forKey:", v5, v4);
          goto LABEL_10;
        }
      }
      else
      {

      }
    }
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v5 = (OCPZipPackagePart *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
LABEL_10:
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v7 = (OCPZipPackagePart *)objc_claimAutoreleasedReturnValue();

  if (v5 == v7)
  {

    v5 = 0;
  }

  return v5;
}

- (void)resetPartForLocation:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[NSMutableDictionary objectForKey:](self->mParts, "objectForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[NSMutableDictionary removeObjectForKey:](self->mParts, "removeObjectForKey:", v5);

}

- (OCPZipPackage)initWithPath:(id)a3
{
  id v4;
  OISFUZipArchive *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *mParts;
  OCPZipPackage *v8;

  v4 = a3;
  v5 = -[OISFUZipArchive initWithPath:collapseCommonRootDirectory:]([OISFUZipArchive alloc], "initWithPath:collapseCommonRootDirectory:", v4, 0);
  v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  mParts = self->mParts;
  self->mParts = v6;

  v8 = -[OCPZipPackage initWithArchive:](self, "initWithArchive:", v5);
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mParts, 0);
  objc_storeStrong((id *)&self->mArchive, 0);
}

@end
