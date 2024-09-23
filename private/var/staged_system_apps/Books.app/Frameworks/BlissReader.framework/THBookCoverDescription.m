@implementation THBookCoverDescription

- (THBookCoverDescription)initWithURL:(id)a3 assetID:(id)a4 summary:(id)a5
{
  THBookCoverDescription *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)THBookCoverDescription;
  v8 = -[THBookCoverDescription init](&v10, "init");
  if (v8)
  {
    v8->mAsset = -[THAsset initWithURL:assetID:]([THAsset alloc], "initWithURL:assetID:", a3, a4);
    v8->mBookSummary = (NSDictionary *)a5;
  }
  return v8;
}

+ (id)summaryWithURL:(id)a3
{
  id result;
  id v6;
  id v7;
  NSString *v8;
  NSString *v9;
  uint64_t v10;
  id v11;

  v11 = 0;
  if (-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", objc_msgSend(a3, "path")))
  {
    result = objc_msgSend(a1, "readEmbeddedArtPropertiesFromURL:error:", a3, &v11);
    if (result)
      return result;
    v6 = v11;
    v7 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[THBookCoverDescription summaryWithURL:]");
    v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBookCoverDescription.m");
    if (v6)
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, v9, 63, CFSTR("Error reading properties from iBook: %@"), objc_msgSend(v11, "description"));
    else
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, v9, 67, CFSTR("Error reading properties from iBook."), v10);
  }
  return 0;
}

- (PFDContext)drmContext
{
  return (PFDContext *)-[PFDContextManager contextForArchive:](+[PFDContextManager sharedInstance](PFDContextManager, "sharedInstance"), "contextForArchive:", -[NSURL path](-[THAsset url](self->mAsset, "url"), "path"));
}

+ (THBookCoverDescription)descriptionWithURL:(id)a3
{
  THBookCoverDescription *result;
  THBookCoverDescription *v5;
  __CFString *v6;
  id v7;
  id v8;
  const __CFString *v9;
  char v10;

  result = (THBookCoverDescription *)objc_msgSend(a1, "summaryWithURL:");
  if (result)
  {
    v5 = result;
    v6 = (__CFString *)-[THBookCoverDescription objectForKey:](result, "objectForKey:", kTHBookCoverInfoUUID);
    if (!-[__CFString length](v6, "length"))
    {
      v7 = -[THBookCoverDescription objectForKey:](v5, "objectForKey:", kTHBookCoverInfoOPF);
      v10 = 0;
      if (v7
        && (v8 = v7,
            -[NSFileManager fileExistsAtPath:isDirectory:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:isDirectory:", objc_msgSend(a3, "path"), &v10))&& v10)
      {
        v9 = (const __CFString *)+[NSString md5StringWithContentsOfFile:](NSString, "md5StringWithContentsOfFile:", objc_msgSend(objc_msgSend(a3, "URLByAppendingPathComponent:", v8), "path"));
      }
      else
      {
        v9 = THUniqueIdForPath(objc_msgSend(a3, "path"));
      }
      v6 = (__CFString *)v9;
    }
    return -[THBookCoverDescription initWithURL:assetID:summary:]([THBookCoverDescription alloc], "initWithURL:assetID:summary:", a3, v6, v5);
  }
  return result;
}

+ (THBookCoverDescription)descriptionWithURL:(id)a3 assetID:(id)a4
{
  THBookCoverDescription *result;

  result = (THBookCoverDescription *)objc_msgSend(a1, "summaryWithURL:");
  if (result)
    return -[THBookCoverDescription initWithURL:assetID:summary:]([THBookCoverDescription alloc], "initWithURL:assetID:summary:", a3, a4, result);
  return result;
}

+ (id)displayNameFromFilePath:(id)a3
{
  return objc_msgSend(objc_msgSend(objc_msgSend(a3, "lastPathComponent"), "stringByDeletingPathExtension"), "tsu_stringByRemovingCharactersInSet:", +[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR(":/")));
}

- (void)dealloc
{
  objc_super v3;

  -[PFDContextManager removeContextForArchive:](+[PFDContextManager sharedInstance](PFDContextManager, "sharedInstance"), "removeContextForArchive:", -[NSURL path](-[THAsset url](self->mAsset, "url"), "path"));

  self->mAsset = 0;
  self->mBookSummary = 0;
  v3.receiver = self;
  v3.super_class = (Class)THBookCoverDescription;
  -[THBookCoverDescription dealloc](&v3, "dealloc");
}

- (id)bookBundleUrl
{
  return -[THAsset url](-[THBookCoverDescription asset](self, "asset"), "url");
}

- (id)embeddedArtURL
{
  id result;

  result = -[THBookCoverDescription embeddedArtHref](self, "embeddedArtHref");
  if (result)
    return objc_msgSend(-[THBookCoverDescription bookBundleUrl](self, "bookBundleUrl"), "URLByAppendingPathComponent:", result);
  return result;
}

- (NSString)embeddedArtHref
{
  return (NSString *)-[NSDictionary objectForKey:](self->mBookSummary, "objectForKey:", kTHBookCoverInfoCoverImageKey);
}

- (id)dcTermsContributor
{
  return -[NSDictionary objectForKey:](self->mBookSummary, "objectForKey:", kTHBookCoverContributor);
}

- (CGImageSource)embeddedArtImageSource
{
  PFDContext *v3;
  const __CFURL *v4;
  CGImageSourceRef v5;

  v3 = -[THBookCoverDescription drmContext](self, "drmContext");
  v4 = -[THBookCoverDescription embeddedArtURL](self, "embeddedArtURL");
  if (v3)
    v5 = -[PFDContext newImageSourceWithContentsOfURL:error:](v3, "newImageSourceWithContentsOfURL:error:", v4, 0);
  else
    v5 = CGImageSourceCreateWithURL(v4, 0);
  return v5;
}

- (BOOL)wasThinned
{
  return -[NSDictionary objectForKey:](self->mBookSummary, "objectForKey:", kTHBookCoverThinningVersion) != 0;
}

- (THAsset)asset
{
  return self->mAsset;
}

+ (BOOL)readEmbeddedArtURLWithArchive:(id)a3 toProperties:(id)a4
{
  NSString *v5;
  xmlTextReader *v6;
  xmlTextReader *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  const xmlChar *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  const xmlChar *v19;
  int Attribute;
  const xmlChar *v21;
  char *v22;
  const xmlChar *v23;
  const xmlChar *v24;
  const xmlChar *v25;
  xmlChar *v26;
  const xmlChar *v27;
  int i;
  const xmlChar *v29;
  const xmlChar *v30;
  int v31;
  __CFString **v32;
  int v33;
  __CFString *v34;
  xmlChar *String;
  id v36;
  xmlChar *InnerXml;
  NSString *v38;
  THAsset *v39;
  THBookVersion *v40;
  THBookVersion *v41;
  uint64_t v42;
  int v43;
  int v44;
  const xmlChar *v45;
  int v46;
  char *v47;
  char *v48;
  const xmlChar *v49;
  const xmlChar *v50;
  unsigned __int8 *v51;
  unsigned __int8 *v52;
  uint64_t v53;
  unsigned __int8 *v54;
  id v55;
  _QWORD *v56;
  id v57;
  id v58;
  id v59;
  NSString *v61;
  id v62;
  NSString *v63;
  id v64;
  NSURL *v65;
  id v66;
  unsigned __int8 v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v71;
  NSString *v72;
  void *__p[2];
  char v74;
  void *v75[2];
  uint64_t v76;
  _OWORD v77[2];
  int v78;
  __int128 v79;
  uint64_t v80;
  void **v81;

  v72 = +[PFAXPackage opfXmlUriFromPackage:](PFAXPackage, "opfXmlUriFromPackage:");
  if (!v72)
    return v72 != 0;
  v5 = v72;
  if (!-[NSString hasPrefix:](v72, "hasPrefix:", CFSTR("/")))
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/%@"), v72);
  objc_msgSend(a4, "setValue:forKey:", v5, kTHBookCoverInfoOPF);
  v67 = objc_msgSend(a3, "isEPUB");
  v66 = objc_alloc_init((Class)NSAutoreleasePool);
  v65 = +[NSURL URLWithString:](NSURL, "URLWithString:", v5);
  v6 = (xmlTextReader *)objc_msgSend(objc_msgSend(a3, "entryWithName:", v5), "xmlReader");
  v7 = v6;
  if (!v6)
    goto LABEL_115;
  v64 = a4;
  v79 = 0uLL;
  v80 = 0;
  memset(v77, 0, sizeof(v77));
  v78 = 1065353216;
  v8 = xmlTextReaderDepth(v6);
  v9 = 0;
  v10 = 0;
  v11 = (int)v8 + 1;
  v71 = (int)v8 + 2;
  do
  {
    do
    {
LABEL_6:
      if (xmlTextReaderRead(v7) == 1)
      {
        v12 = xmlTextReaderDepth(v7);
        v13 = xmlTextReaderNodeType(v7);
        if (v12 != (_DWORD)v8 || v13 != 15)
          continue;
      }
      goto LABEL_111;
    }
    while (v11 != v12 || v13 != 1);
    v14 = xmlTextReaderConstLocalName(v7);
    if (xmlStrEqual(v14, (const xmlChar *)"metadata"))
    {
      v68 = v11;
      v69 = v8;
      v62 = 0;
      v63 = 0;
      v61 = 0;
LABEL_15:
      v15 = v9;
      v16 = v10;
      while (1)
      {
LABEL_16:
        v10 = v16;
        v9 = v15;
        v11 = v68;
        v8 = v69;
        if (xmlTextReaderRead(v7) != 1)
          goto LABEL_6;
        v17 = xmlTextReaderDepth(v7);
        v18 = xmlTextReaderNodeType(v7);
        if (v17 == v12 && v18 == 15)
        {
          if (v62)
          {
            v38 = v61;
            v39 = -[THAsset initWithURL:assetID:]([THAsset alloc], "initWithURL:assetID:", +[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", objc_msgSend(a3, "rootPath"), objc_msgSend(a3, "isDirectory")), v62);
          }
          else
          {
            v39 = 0;
            v38 = v61;
          }
          if (v63)
            v40 = -[THBookVersion initWithString:]([THBookVersion alloc], "initWithString:", v63);
          else
            v40 = +[THBookVersion newUnversionedBookVersion](THBookVersion, "newUnversionedBookVersion");
          v41 = v40;
          objc_msgSend(a3, "setBookVersion:", v40);
          objc_msgSend(a3, "setAsset:", v39);
          if (v38)
            objc_msgSend(v64, "setObject:forKey:", v38, kTHBookCoverThinningVersion);

          goto LABEL_6;
        }
        v16 = v10;
        if (v71 != v17)
          continue;
        v16 = v10;
        if (v18 != 1)
          continue;
        v19 = xmlTextReaderConstLocalName(v7);
        if (!xmlStrEqual(v19, (const xmlChar *)"meta"))
        {
          v15 = 1;
          v16 = 1;
          if ((v9 & v10 & 1) == 0)
          {
            v27 = xmlTextReaderConstNamespaceUri(v7);
            v15 = v9;
            v16 = v10;
            if (xmlStrEqual(v27, (const xmlChar *)PFXCommonDublinCoreMetadataNS[0]))
            {
              if (xmlStrEqual((const xmlChar *)"identifier", v19))
              {
                for (i = xmlTextReaderMoveToFirstAttribute(v7); ; i = xmlTextReaderMoveToNextAttribute(v7))
                {
                  if (i != 1)
                    goto LABEL_15;
                  v29 = xmlTextReaderConstLocalName(v7);
                  v30 = xmlTextReaderConstValue(v7);
                  if ((v67 & 1) != 0)
                  {
                    if (xmlStrEqual(v29, (const xmlChar *)"id"))
                    {
                      v33 = xmlStrEqual(v30, (const xmlChar *)"uid");
LABEL_55:
                      v15 = v9;
                      v16 = v10;
                      if (!v33)
                        goto LABEL_16;
                      v15 = 1;
                      v16 = v10;
                      v32 = &kTHBookCoverInfoUUID;
                      goto LABEL_57;
                    }
                  }
                  else if (xmlStrEqual(v29, (const xmlChar *)"scheme"))
                  {
                    v33 = xmlStrEqual(v30, (const xmlChar *)"UUID");
                    goto LABEL_55;
                  }
                }
              }
              v15 = v9;
              v16 = v10;
              if (xmlStrEqual((const xmlChar *)"contributor", v19))
              {
                v16 = 1;
                v15 = v9;
                v32 = &kTHBookCoverContributor;
LABEL_57:
                v34 = *v32;
                if (*v32 && !xmlTextReaderIsEmptyElement(v7))
                {
                  String = xmlTextReaderReadString(v7);
                  v36 = objc_msgSend(objc_alloc((Class)NSString), "initWithXmlString:", String);
                  if (!v36)
                  {
                    InnerXml = xmlTextReaderReadInnerXml(v7);
                    v36 = objc_msgSend(objc_alloc((Class)NSString), "initWithXmlString:", InnerXml);
                    if (InnerXml)
                      xmlFree(InnerXml);
                  }
                  objc_msgSend(v64, "setValue:forKey:", v36, v34);
                  if (objc_msgSend(kTHBookCoverInfoUUID, "isEqualToString:", v34))
                    v62 = objc_msgSend(v36, "copy");
                  if (String)
                    xmlFree(String);

                }
              }
            }
          }
          continue;
        }
        Attribute = xmlTextReaderMoveToFirstAttribute(v7);
        v21 = 0;
        v22 = 0;
        v23 = 0;
        while (Attribute == 1)
        {
          v24 = xmlTextReaderConstLocalName(v7);
          v25 = xmlTextReaderConstValue(v7);
          if (xmlStrEqual(v24, (const xmlChar *)"name"))
          {
            v21 = v25;
            if (!v25)
              goto LABEL_34;
          }
          else if (xmlStrEqual(v24, (const xmlChar *)"content"))
          {
            v22 = (char *)v25;
            if (!v21)
              goto LABEL_34;
          }
          else
          {
            if (xmlStrEqual(v24, (const xmlChar *)"property"))
              v23 = v25;
            if (!v21)
              goto LABEL_34;
          }
          if (v22)
            break;
LABEL_34:
          Attribute = xmlTextReaderMoveToNextAttribute(v7);
        }
        if (xmlStrEqual((const xmlChar *)"cover", v21))
        {
          sub_1CEE44(v75, v22);
          if (SHIBYTE(v80) < 0)
            operator delete((void *)v79);
          v79 = *(_OWORD *)v75;
          v80 = v76;
          goto LABEL_15;
        }
        if (xmlStrEqual((const xmlChar *)"ibooks:version", v23))
        {
          v26 = xmlTextReaderReadInnerXml(v7);
          v63 = +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", v26);
          v15 = v9;
          v16 = v10;
          if (v26)
          {
            xmlFree(v26);
            v15 = v9;
            v16 = v10;
          }
        }
        else
        {
          v31 = xmlStrEqual((const xmlChar *)"ibooks:thinningversion", v21);
          v15 = v9;
          v16 = v10;
          if (v31)
          {
            v15 = v9;
            v16 = v10;
            if (v22)
            {
              v61 = +[NSString stringWithXmlString:](NSString, "stringWithXmlString:", v22);
              v15 = v9;
              v16 = v10;
            }
          }
        }
      }
    }
  }
  while (!xmlStrEqual(v14, (const xmlChar *)"manifest"));
  v42 = HIBYTE(v80);
  if (v80 < 0)
    v42 = *((_QWORD *)&v79 + 1);
  if (v42)
  {
    while (xmlTextReaderRead(v7) == 1)
    {
      v43 = xmlTextReaderDepth(v7);
      v44 = xmlTextReaderNodeType(v7);
      if (v43 == v12 && v44 == 15)
      {
        if (objc_msgSend(a3, "isDirectory"))
        {
          v53 = HIBYTE(v80);
          if (v80 < 0)
            v53 = *((_QWORD *)&v79 + 1);
          if (v53)
          {
            v54 = sub_1D3C70(v77, (unsigned __int8 *)&v79);
            if (v54)
            {
              v55 = objc_alloc((Class)NSString);
              v56 = v54 + 40;
              if ((char)v54[63] < 0)
                v56 = (_QWORD *)*v56;
              v57 = objc_msgSend(v55, "initWithUTF8String:", v56);
              v58 = objc_msgSend(objc_alloc((Class)NSURL), "initWithString:relativeToURL:", v57, v65);
              v59 = objc_msgSend(v58, "path");
              objc_msgSend(a3, "checkEncryption");
              objc_msgSend(v64, "setValue:forKey:", v59, kTHBookCoverInfoCoverImageKey);

            }
          }
        }
        break;
      }
      if (v71 == v43 && v44 == 1)
      {
        v45 = xmlTextReaderConstLocalName(v7);
        if (xmlStrEqual(v45, (const xmlChar *)"item"))
        {
          v46 = xmlTextReaderMoveToFirstAttribute(v7);
          v47 = 0;
          v48 = 0;
          while (v46 == 1)
          {
            v49 = xmlTextReaderConstLocalName(v7);
            v50 = xmlTextReaderConstValue(v7);
            if (xmlStrEqual(v49, (const xmlChar *)"id"))
            {
              v47 = (char *)v50;
            }
            else if (xmlStrEqual(v49, (const xmlChar *)"href"))
            {
              v48 = (char *)v50;
            }
            v46 = xmlTextReaderMoveToNextAttribute(v7);
          }
          if (xmlStrlen((const xmlChar *)v47) >= 1 && xmlStrlen((const xmlChar *)v48) >= 1)
          {
            sub_1CEE44(v75, v48);
            sub_1CEE44(__p, v47);
            v81 = __p;
            v51 = sub_206A00((uint64_t)v77, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v81);
            v52 = v51 + 40;
            if ((char)v51[63] < 0)
              operator delete(*(void **)v52);
            *(_OWORD *)v52 = *(_OWORD *)v75;
            *((_QWORD *)v52 + 2) = v76;
            HIBYTE(v76) = 0;
            LOBYTE(v75[0]) = 0;
            if (v74 < 0)
            {
              operator delete(__p[0]);
              if (SHIBYTE(v76) < 0)
                operator delete(v75[0]);
            }
          }
        }
      }
    }
  }
LABEL_111:
  sub_1EA374((uint64_t)v77);
  if (SHIBYTE(v80) < 0)
    operator delete((void *)v79);
  if (v7)
    xmlFreeTextReader(v7);
LABEL_115:

  return v72 != 0;
}

+ (id)readEmbeddedArtPropertiesFromURL:(id)a3 error:(id *)a4
{
  id v7;
  PFXArchive *v8;

  objc_opt_class(PFXConstants);
  v7 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  v8 = -[PFXArchive initWithPath:allowArchive:]([PFXArchive alloc], "initWithPath:allowArchive:", objc_msgSend(a3, "path"), 1);
  if (!-[PFXArchive isValid](v8, "isValid"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[THBookCoverDescription(ApplePubReader) readEmbeddedArtPropertiesFromURL:error:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/THBookCoverDescriptionAdditions.mm"), 376, CFSTR("Failed to load valid archive"));
  if (-[PFXArchive isValid](v8, "isValid"))
  {
    -[PFXArchive setPreventUseOfEncryptionCache:](v8, "setPreventUseOfEncryptionCache:", +[THBookDescription isSampleAtURL:](THBookDescription, "isSampleAtURL:", a3));
    objc_msgSend(a1, "readEmbeddedArtURLWithArchive:toProperties:", v8, v7);
  }

  if (a4 && *a4)
    return 0;
  return v7;
}

@end
