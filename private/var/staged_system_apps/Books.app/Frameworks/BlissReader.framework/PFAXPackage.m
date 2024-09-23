@implementation PFAXPackage

+ (void)writeContainerXmlToStream:(id)a3
{
  _xmlTextWriter *v3;

  v3 = +[PFXStreamWriter createXmlTextWriterAtEntry:inOutputStream:isCompressed:](PFXStreamWriter, "createXmlTextWriterAtEntry:inOutputStream:isCompressed:", CFSTR("META-INF/container.xml"), a3, 1);
  xmlTextWriterStartDocument(v3, 0, "UTF-8", 0);
  if (+[PFXStreamWriter startElementInStream:name:prefix:ns:](PFXStreamWriter, "startElementInStream:name:prefix:ns:", v3, CFSTR("container"), 0, PFXCommonEpubContainerNS[0]))
  {
    +[PFXStreamWriter writeAttributeToStream:name:content:](PFXStreamWriter, "writeAttributeToStream:name:content:", v3, CFSTR("version"), CFSTR("1.0"));
  }
  +[PFXStreamWriter startElementInStream:name:](PFXStreamWriter, "startElementInStream:name:", v3, CFSTR("rootfiles"));
  if (+[PFXStreamWriter startElementInStream:name:](PFXStreamWriter, "startElementInStream:name:", v3, CFSTR("rootfile"))&& +[PFXStreamWriter writeAttributeToStream:name:content:](PFXStreamWriter, "writeAttributeToStream:name:content:", v3, CFSTR("full-path"), CFSTR("contents/publication.xml")))
  {
    +[PFXStreamWriter writeAttributeToStream:name:content:](PFXStreamWriter, "writeAttributeToStream:name:content:", v3, CFSTR("media-type"), PFXCommonOEBPSPackageMediaType);
  }
  xmlTextWriterEndDocument(v3);
  xmlTextWriterFlush(v3);
  xmlFreeTextWriter(v3);
}

+ (id)opfXmlUriFromPackage:(id)a3
{
  id v3;
  xmlTextReader *v4;
  xmlTextReader *v5;
  int v6;
  int v7;
  int v8;
  const xmlChar *v9;
  const xmlChar *v10;
  xmlChar *Attribute;
  xmlChar *v12;
  int v13;
  NSString *v14;
  int v16;
  const xmlChar *v17;
  int v18;
  int v19;
  const xmlChar *v20;
  int v21;
  xmlChar *v22;
  xmlChar *v23;
  int v24;
  xmlChar *v25;
  xmlChar *v26;

  v3 = objc_msgSend(a3, "entryWithName:", CFSTR("META-INF/container.xml"));
  if (!v3)
    return 0;
  v4 = (xmlTextReader *)objc_msgSend(v3, "xmlReader");
  if (!v4)
    return 0;
  v5 = v4;
  v6 = xmlTextReaderDepth(v4);
  while (xmlTextReaderRead(v5) == 1)
  {
    v7 = xmlTextReaderNodeType(v5);
    v8 = xmlTextReaderDepth(v5);
    if (v8 == v6 && v7 == 15)
      break;
    if (v8 == v6 && v7 == 1)
    {
      v9 = xmlTextReaderConstLocalName(v5);
      if (xmlStrEqual(v9, (const xmlChar *)"container"))
      {
        v10 = xmlTextReaderConstNamespaceUri(v5);
        if (xmlStrEqual(v10, (const xmlChar *)PFXCommonEpubContainerNS[0]))
        {
          Attribute = xmlTextReaderGetAttribute(v5, (const xmlChar *)"version");
          if (Attribute)
          {
            v12 = Attribute;
            v13 = xmlStrEqual(Attribute, (const xmlChar *)"1.0");
            xmlFree(v12);
            if (v13)
            {
              v16 = xmlTextReaderDepth(v5);
              if (xmlTextReaderRead(v5) == 1)
              {
                while (1)
                {
                  v17 = xmlTextReaderConstLocalName(v5);
                  v18 = xmlTextReaderNodeType(v5);
                  v19 = xmlTextReaderDepth(v5);
                  if (v19 == v16 && v18 == 15)
                    break;
                  v14 = 0;
                  if (v16 + 1 == v19 && v18 == 1)
                  {
                    if (xmlStrEqual(v17, (const xmlChar *)"rootfiles"))
                    {
                      while (xmlTextReaderRead(v5) == 1)
                      {
                        v20 = xmlTextReaderConstLocalName(v5);
                        v21 = xmlTextReaderNodeType(v5);
                        if (v16 + 2 == xmlTextReaderDepth(v5) && v21 == 1)
                        {
                          if (xmlStrEqual(v20, (const xmlChar *)"rootfile"))
                          {
                            v22 = xmlTextReaderGetAttribute(v5, (const xmlChar *)"media-type");
                            if (v22)
                            {
                              v23 = v22;
                              v24 = xmlStrEqual(v22, (const xmlChar *)PFXCommonOEBPSPackageMediaTypeXmlChars);
                              xmlFree(v23);
                              if (v24)
                              {
                                v25 = xmlTextReaderGetAttribute(v5, (const xmlChar *)"full-path");
                                if (v25)
                                {
                                  v26 = v25;
                                  v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v25);
                                  xmlFree(v26);
                                  goto LABEL_32;
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                    v14 = 0;
                  }
LABEL_32:
                  if (xmlTextReaderRead(v5) != 1 || v14)
                    goto LABEL_14;
                }
              }
              break;
            }
          }
        }
      }
    }
  }
  v14 = 0;
LABEL_14:
  xmlFreeTextReader(v5);
  return v14;
}

+ (void)writeMimetypeEntry:(id)a3 toStream:(id)a4
{
  +[PFXCommon writeString:toStream:atEntry:isCompressed:](PFXCommon, "writeString:toStream:atEntry:isCompressed:", PFXCommonApubMimeType, a4, CFSTR("mimetype"), 0);
}

+ (BOOL)validateMimetypeInArchive:(id)a3 validMimetypes:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  NSString *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  _BYTE *v15;
  _BYTE *v16;
  _BYTE *v17;
  BOOL v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  if (!a3)
    return 0;
  v5 = objc_msgSend(a3, "entryWithName:", CFSTR("mimetype"));
  if (!v5)
    return 0;
  v6 = v5;
  v7 = objc_alloc_init((Class)NSMutableData);
  if (!objc_msgSend(v6, "readIntoData:", v7))
    goto LABEL_17;
  v8 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v7, 4);
  v9 = +[NSString stringWithString:](NSString, "stringWithString:", v8);

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(a4);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v15 = -[NSString length](v9, "length");
        v16 = objc_msgSend(v14, "length");
        if (v15 > v16)
        {
          v17 = v16;
          if (!-[NSString length](-[NSString stringByTrimmingCharactersInSet:](-[NSString substringWithRange:](v9, "substringWithRange:", v16, v15 - v16), "stringByTrimmingCharactersInSet:", +[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet")), "length"))v9 = -[NSString substringToIndex:](v9, "substringToIndex:", v17);
        }
        if (-[NSString isEqualToString:](-[NSString lowercaseString](v9, "lowercaseString"), "isEqualToString:", v14))
        {
          v18 = 1;
          goto LABEL_19;
        }
      }
      v11 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      v18 = 0;
      if (v11)
        continue;
      break;
    }
  }
  else
  {
LABEL_17:
    v18 = 0;
  }
LABEL_19:

  return v18;
}

+ (id)encryptionXmlPathForArchive:(id)a3
{
  return objc_msgSend(a1, "encryptionXmlPathForArchiveAtPath:", objc_msgSend(a3, "rootFolder"));
}

+ (id)encryptionXmlPathForArchiveAtPath:(id)a3
{
  return objc_msgSend(a3, "stringByAppendingString:", CFSTR("/META-INF/encryption.xml"));
}

+ (id)newAllEncryptionInfoFromAssetForArchiveAtPath:(id)a3
{
  BOOL v3;
  char v5;

  v5 = 0;
  if (-[NSFileManager fileExistsAtPath:isDirectory:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:isDirectory:", objc_msgSend(a1, "encryptionXmlPathForArchiveAtPath:"), &v5))
  {
    v3 = v5 == 0;
  }
  else
  {
    v3 = 0;
  }
  if (v3)
    operator new();
  return 0;
}

+ (id)newAllEncryptionInfoFromAssetForArchive:(id)a3
{
  return objc_msgSend(a1, "newAllEncryptionInfoFromAssetForArchiveAtPath:", objc_msgSend(a3, "rootFolder"));
}

+ (id)newAllEncryptionInfoFromCacheForArchive:(id)a3 originalEncryptionPath:(id)a4
{
  id v7;
  _UNKNOWN **v8;
  id v9;
  BOOL v10;
  id v11;
  uint64_t v12;
  double v13;
  id v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  NSURL *v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  THBookVersion *v33;
  THBookVersion *v34;
  NSDate *v35;
  NSDictionary *v36;
  id v37;
  _BOOL4 v38;
  double v39;
  _BOOL4 v40;
  unsigned int v41;
  unsigned int v42;
  id v43;
  id v44;
  uint64_t v45;
  id v46;
  id v47;
  id v48;
  NSNumber *v49;
  id v50;
  id v51;
  id v52;
  id v53;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  id v58;
  id v59;
  id v60;
  char v61;

  if (!objc_msgSend(objc_msgSend(a3, "asset"), "assetID"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[PFAXPackage newAllEncryptionInfoFromCacheForArchive:originalEncryptionPath:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/XML/PFAXPackage.mm"), 455, CFSTR("Attempting to cache an asset without an ID."));
  v7 = objc_msgSend(+[THApplicationDelegate cacheDirectoryForAsset:](THApplicationDelegate, "cacheDirectoryForAsset:", objc_msgSend(a3, "asset")), "stringByAppendingPathComponent:", CFSTR("encryption_xml_cache.plist"));
  v8 = &AEAnnotationPopoverShouldHideNotification_ptr;
  v59 = v7;
  if (v7
    && ((v9 = v7,
         v61 = 0,
         -[NSFileManager fileExistsAtPath:isDirectory:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:isDirectory:", v7, &v61))? (v10 = v61 == 0): (v10 = 0), v10))
  {
    v11 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithContentsOfFile:", v9);
  }
  else
  {
    v11 = 0;
  }
  v60 = 0;
  -[NSURL getResourceValue:forKey:error:](+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", a4), "getResourceValue:forKey:error:", &v60, NSURLFileSizeKey, 0);
  if (v11)
  {
    v58 = a1;
    v12 = objc_opt_class(NSNumber);
    *(_QWORD *)&v13 = TSUDynamicCast(v12, objc_msgSend(v11, "objectForKey:", PFAXPackageEncryptionCacheVersion)).n128_u64[0];
    objc_msgSend(v14, "doubleValue", v13);
    v16 = v15;
    v17 = objc_opt_class(NSDate);
    TSUDynamicCast(v17, objc_msgSend(v11, "objectForKey:", PFAXPackageEncryptionCacheTimestamp));
    v19 = v18;
    v20 = objc_opt_class(NSString);
    TSUDynamicCast(v20, objc_msgSend(v11, "objectForKey:", PFAXPackageEncryptionCacheAssetID));
    v57 = v21;
    v22 = objc_opt_class(NSString);
    TSUDynamicCast(v22, objc_msgSend(v11, "objectForKey:", PFAXPackageEncryptionCacheAssetType));
    v55 = v23;
    v24 = objc_opt_class(NSNumber);
    TSUDynamicCast(v24, objc_msgSend(v11, "objectForKey:", PFAXPackageEncryptionCacheOriginalEncryptionFileSize));
    v56 = v25;
    v26 = objc_opt_class(NSString);
    *(_QWORD *)&v28 = TSUDynamicCast(v26, objc_msgSend(v11, "objectForKey:", PFAXPackageEncryptionCacheAssetURL)).n128_u64[0];
    if (v27)
      v29 = +[NSURL URLWithString:](NSURL, "URLWithString:", v27, v28);
    else
      v29 = 0;
    v30 = objc_opt_class(NSString);
    *(_QWORD *)&v32 = TSUDynamicCast(v30, objc_msgSend(v11, "objectForKey:", PFAXPackageEncryptionCacheBookVersion)).n128_u64[0];
    if (v31)
      v33 = -[THBookVersion initWithString:]([THBookVersion alloc], "initWithString:", v31);
    else
      v33 = +[THBookVersion unversionedBookVersion](THBookVersion, "unversionedBookVersion", v32);
    v34 = v33;
    v35 = +[NSDate date](NSDate, "date");
    v36 = -[NSFileManager attributesOfItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "attributesOfItemAtPath:error:", objc_msgSend(v58, "encryptionXmlPathForArchive:", a3), 0);
    if (v36)
      v37 = -[NSDictionary objectForKey:](v36, "objectForKey:", NSFileCreationDate);
    else
      v37 = 0;
    v38 = 0;
    v39 = fabs(v16 + -1.0);
    v40 = 1;
    if (v37 && v19)
    {
      v38 = -[NSDate compare:](v35, "compare:", v37) != NSOrderedAscending
         && -[NSDate compare:](v35, "compare:", v19) != NSOrderedAscending;
      v40 = objc_msgSend(v37, "compare:", v19) == (char *)&dword_0 + 1;
    }
    v41 = +[THAsset asset:isSameAsAsset:](THAsset, "asset:isSameAsAsset:", objc_msgSend(a3, "asset"), +[THAsset assetWithURL:assetID:type:](THAsset, "assetWithURL:assetID:type:", v29, v57, v55));
    v42 = objc_msgSend(objc_msgSend(a3, "bookVersion"), "isEqualToBookVersion:", v34);
    v43 = objc_msgSend(v60, "integerValue");
    v44 = objc_msgSend(v56, "integerValue");
    if (v39 < 0.00999999978 && !v40 && v41 && v42 && v38 && v43 == v44)
    {
      v45 = objc_opt_class(NSDictionary);
      TSUDynamicCast(v45, objc_msgSend(v11, "objectForKey:", PFAXPackageEncryptionCachePayload));
      v47 = v46;

      v8 = &AEAnnotationPopoverShouldHideNotification_ptr;
      if (v47)
        return v47;
    }
    else
    {

      v8 = &AEAnnotationPopoverShouldHideNotification_ptr;
    }
    a1 = v58;
    if (-[NSFileManager isDeletableFileAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "isDeletableFileAtPath:", v59))
    {
      -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", v59, 0);
    }
  }
  v47 = objc_msgSend(a1, "newAllEncryptionInfoFromAssetForArchive:", a3);
  v48 = objc_alloc_init((Class)v8[436]);
  v49 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 1.0);
  objc_msgSend(v48, "setObject:forKey:", v49, PFAXPackageEncryptionCacheVersion);
  objc_msgSend(v48, "setObject:forKey:", +[NSDate date](NSDate, "date"), PFAXPackageEncryptionCacheTimestamp);
  if (objc_msgSend(objc_msgSend(a3, "asset"), "assetID"))
  {
    v50 = objc_msgSend(objc_msgSend(a3, "asset"), "assetID");
    objc_msgSend(v48, "setObject:forKey:", v50, PFAXPackageEncryptionCacheAssetID);
  }
  if (objc_msgSend(objc_msgSend(a3, "asset"), "assetType"))
  {
    v51 = objc_msgSend(objc_msgSend(a3, "asset"), "assetType");
    objc_msgSend(v48, "setObject:forKey:", v51, PFAXPackageEncryptionCacheAssetType);
  }
  if (objc_msgSend(objc_msgSend(a3, "asset"), "url"))
  {
    v52 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "asset"), "url"), "absoluteString");
    objc_msgSend(v48, "setObject:forKey:", v52, PFAXPackageEncryptionCacheAssetURL);
  }
  if (objc_msgSend(objc_msgSend(a3, "bookVersion"), "versionString"))
  {
    v53 = objc_msgSend(objc_msgSend(a3, "bookVersion"), "versionString");
    objc_msgSend(v48, "setObject:forKey:", v53, PFAXPackageEncryptionCacheBookVersion);
  }
  if (v47)
    objc_msgSend(v48, "setObject:forKey:", v47, PFAXPackageEncryptionCachePayload);
  if (v60)
    objc_msgSend(v48, "setObject:forKey:", v60, PFAXPackageEncryptionCacheOriginalEncryptionFileSize);
  +[THApplicationDelegate ensureCacheDirectory:](THApplicationDelegate, "ensureCacheDirectory:", objc_msgSend(a3, "asset"));
  objc_msgSend(v48, "writeToFile:atomically:", v59, 1);

  return v47;
}

+ (id)newAllEncryptionInfoForArchive:(id)a3
{
  id v5;
  BOOL v6;
  unsigned int v8;
  char v9;

  v5 = objc_msgSend(a1, "encryptionXmlPathForArchive:");
  v9 = 0;
  if (-[NSFileManager fileExistsAtPath:isDirectory:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:isDirectory:", v5, &v9))
  {
    v6 = v9 == 0;
  }
  else
  {
    v6 = 0;
  }
  if (!v6)
    return 0;
  v8 = -[NSUserDefaults BOOLForKey:](+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"), "BOOLForKey:", CFSTR("preventUseOfEncryptionCache"));
  if (objc_msgSend(objc_msgSend(a3, "asset"), "assetID")
    && objc_msgSend(objc_msgSend(a3, "bookVersion"), "isValid")
    && ((objc_msgSend(a3, "preventUseOfEncryptionCache") | v8) & 1) == 0)
  {
    return objc_msgSend(a1, "newAllEncryptionInfoFromCacheForArchive:originalEncryptionPath:", a3, v5);
  }
  else
  {
    return objc_msgSend(a1, "newAllEncryptionInfoFromAssetForArchive:", a3);
  }
}

+ (__CFDictionary)rightsInfoForArchive:(id)a3
{
  return (__CFDictionary *)objc_msgSend(a1, "rightsInfoForArchiveAtPath:", objc_msgSend(a3, "perUserRootFolder"));
}

+ (__CFDictionary)rightsInfoForArchiveAtPath:(id)a3
{
  BOOL v3;
  char v5;

  if (a3)
  {
    v5 = 0;
    if (-[NSFileManager fileExistsAtPath:isDirectory:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:isDirectory:", objc_msgSend(a3, "stringByAppendingString:", CFSTR("/META-INF/sinf.xml")), &v5))
    {
      v3 = v5 == 0;
    }
    else
    {
      v3 = 0;
    }
    if (v3)
      operator new();
  }
  return 0;
}

@end
