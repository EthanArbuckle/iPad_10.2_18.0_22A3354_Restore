@implementation OCPZipPackagePart

- (OCPZipPackagePart)initWithArchive:(id)a3 location:(id)a4 package:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  OISFUZipEntry *v13;
  OISFUZipEntry *mEntry;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  xmlDoc *v22;
  OCPZipPackagePart *v23;
  OCPZipPackagePart *v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "substringFromIndex:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "entryWithName:", v12);
  v13 = (OISFUZipEntry *)objc_claimAutoreleasedReturnValue();
  mEntry = self->mEntry;
  self->mEntry = v13;

  if (self->mEntry)
  {
    objc_msgSend(v12, "stringByDeletingLastPathComponent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringByAppendingPathComponent:", CFSTR("_rels"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "lastPathComponent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringByAppendingPathExtension:", CFSTR("rels"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "stringByAppendingPathComponent:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "entryWithName:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
      v22 = (xmlDoc *)objc_msgSend(v20, "xmlDocument");
    else
      v22 = 0;

    v24 = -[OCPPackagePart initWithLocation:relationshipsXml:package:](self, "initWithLocation:relationshipsXml:package:", v9, v22, v10);
    xmlFreeDoc(v22);
    self = v24;
    v23 = self;
  }
  else
  {

    v23 = 0;
  }

  return v23;
}

- (_xmlDoc)xmlDocument
{
  _xmlDoc *result;
  _xmlDoc *v4;

  result = self->super.mDocument;
  if (!result)
  {
    v4 = -[OISFUDataRepresentation xmlDocument](self->mEntry, "xmlDocument");
    self->super.mDocument = v4;
    v4->_private = self;
    return self->super.mDocument;
  }
  return result;
}

- (_xmlTextReader)xmlReader
{
  return -[OISFUDataRepresentation xmlReader](self->mEntry, "xmlReader");
}

- (id)data
{
  return -[OISFUZipEntry data](self->mEntry, "data");
}

- (void)copyToFile:(id)a3
{
  -[OISFUZipEntry copyToFile:](self->mEntry, "copyToFile:", a3);
}

- (OISFUZipEntry)zipEntry
{
  return self->mEntry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mEntry, 0);
}

@end
