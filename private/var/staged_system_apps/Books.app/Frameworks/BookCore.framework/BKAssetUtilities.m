@implementation BKAssetUtilities

+ (signed)contentTypeForBKAssetContentType:(signed __int16)a3
{
  uint64_t v3;

  v3 = a3 - 1;
  if (v3 > 0x12)
    return -1;
  else
    return word_26A3E8[v3];
}

+ (signed)assetContentTypeForContentType:(signed __int16)a3
{
  if (a3 > 4)
    return 0;
  else
    return word_26A40E[a3];
}

+ (signed)assetContentTypeForBKAssetContentType:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  signed __int16 v6;

  v3 = a3;
  if (v3
    && (v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_2AFA00, "objectForKeyedSubscript:", v3))) != 0)
  {
    v5 = v4;
    v6 = (unsigned __int16)objc_msgSend(v4, "integerValue");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (signed)contentTypeForExtension:(id)a3
{
  void *v3;
  signed __int16 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "lowercaseString"));
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("epub")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("pdf")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ibooks")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("m4a")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("m4b")) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("m4p")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("aa")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("aax")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("mp3")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("mp4")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("aac")) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("adts")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ac3")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("aif")) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("aiff")) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("aifc")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("caf")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("snd")) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("au")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("sd2")) & 1) != 0)
  {
    v4 = 16;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("wav")))
  {
    v4 = 18;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)pathExtensionForContentType:(signed __int16)a3
{
  uint64_t v3;

  v3 = a3 - 1;
  if (v3 > 0x12)
    return 0;
  else
    return *(&off_28FD40 + v3);
}

+ (id)utiTypeForContentType:(signed __int16)a3
{
  __CFString *v3;
  id *v4;

  v3 = 0;
  switch(a3)
  {
    case 1:
      v4 = (id *)&UTTypeEPUB;
      goto LABEL_7;
    case 2:
      v4 = (id *)&UTTypeText;
      goto LABEL_7;
    case 3:
      v4 = (id *)&UTTypePDF;
      goto LABEL_7;
    case 4:
      return CFSTR("com.apple.ibooks-container");
    case 6:
      v4 = (id *)&UTTypeDirectory;
LABEL_7:
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v4, "identifier"));
      return v3;
    case 7:
      return CFSTR("com.apple.m4a-audio");
    case 8:
      return CFSTR("com.apple.protected-mpeg-4-audio");
    case 9:
      return CFSTR("com.audible.aa-audiobook");
    case 10:
      return CFSTR("com.audible.aax-audiobook");
    case 11:
      return CFSTR("public.mp3");
    case 12:
      return CFSTR("public.aac-audio");
    case 13:
      return CFSTR("public.ac3-audio");
    case 14:
      return CFSTR("public.aiff-audio");
    case 15:
      return CFSTR("com.apple.coreaudio-format");
    case 16:
      return CFSTR("com.digidesign.sd2-audio");
    case 17:
      return CFSTR("public.au-audio");
    case 18:
      return CFSTR("com.microsoft.waveform-audio");
    case 19:
      v3 = CFSTR("public.mpeg-4");
      return v3;
    default:
      return v3;
  }
}

+ (BOOL)supportsRestorationSnapshots:(signed __int16)a3
{
  return a3 == 1;
}

+ (BOOL)isAggregateContentType:(signed __int16)a3
{
  return a3 == 6;
}

+ (BOOL)requiresAggregateContentType:(signed __int16)a3
{
  return +[BKAssetUtilities isAudiobookTrackContentType:](BKAssetUtilities, "isAudiobookTrackContentType:", a3);
}

+ (BOOL)isAudiobookTrackContentType:(signed __int16)a3
{
  return (unsigned __int16)a3 - 7 < 0xD;
}

+ (id)aggregateIdentifierFromAsset:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "assetID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "url"));
  v6 = objc_msgSend(v3, "contentType");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKAssetUtilities aggregateIdentifierFromAssetID:assetURL:contentType:](BKAssetUtilities, "aggregateIdentifierFromAssetID:assetURL:contentType:", v4, v5, v6));
  return v7;
}

+ (id)aggregateIdentifierFromAssetID:(id)a3 assetURL:(id)a4 contentType:(signed __int16)a5
{
  uint64_t v5;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;

  v5 = a5;
  v7 = a4;
  v8 = objc_msgSend(a3, "copy");
  if (+[BKAssetUtilities requiresAggregateContentType:](BKAssetUtilities, "requiresAggregateContentType:", v5))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
    if (objc_msgSend(v9, "length"))
    {
      v10 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v8, v9));

      v8 = (id)v10;
    }

  }
  return v8;
}

+ (BOOL)filenameForAsset:(id)a3 matches:(id)a4
{
  id v5;
  id v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  if ((objc_opt_respondsToSelector(v6, "filenameMatches:") & 1) != 0)
  {
    v7 = objc_msgSend(v6, "filenameMatches:", v5);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "url"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
    v7 = objc_msgSend(v9, "isEqualToString:", v5);

    v6 = v8;
  }

  return v7;
}

+ (signed)contentTypeForPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  signed __int16 v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pathExtension"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lowercaseString"));

  if (objc_msgSend(v6, "length"))
  {
    v7 = (unsigned __int16)objc_msgSend(a1, "contentTypeForExtension:", v6);
  }
  else if (objc_msgSend(v4, "length"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v4));
    if (objc_msgSend(v8, "bu_isFolder"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v8, 0, 4, 0));

      if (objc_msgSend(v10, "count"))
      {
        v22 = 0u;
        v23 = 0u;
        v20 = 0u;
        v21 = 0u;
        v11 = v10;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v12)
        {
          v13 = v12;
          v19 = v10;
          v14 = *(_QWORD *)v21;
          while (2)
          {
            for (i = 0; i != v13; i = (char *)i + 1)
            {
              if (*(_QWORD *)v21 != v14)
                objc_enumerationMutation(v11);
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1)
                                                                                 + 8 * (_QWORD)i), "pathExtension"));
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "lowercaseString"));

              LODWORD(v16) = objc_msgSend(a1, "isAudiobookTrackContentType:", objc_msgSend(a1, "contentTypeForExtension:", v17));
              if (!(_DWORD)v16)
              {
                v7 = 0;
                goto LABEL_18;
              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
            if (v13)
              continue;
            break;
          }
          v7 = 6;
LABEL_18:
          v10 = v19;
        }
        else
        {
          v7 = 6;
        }

      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)localizedAssetKindForContentType:(signed __int16)a3
{
  id v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  __CFString *v7;
  id v9;
  id v10;
  id v11;
  id v12;

  switch(a3)
  {
    case 0:
    case 5:
      v7 = &stru_296430;
      return v7;
    case 1:
    case 4:
      v9 = IMCommonCoreBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v5 = v4;
      v6 = CFSTR("Book");
      goto LABEL_3;
    case 2:
      v10 = IMCommonCoreBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v5 = v4;
      v6 = CFSTR("Text");
      goto LABEL_3;
    case 3:
      v11 = IMCommonCoreBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v5 = v4;
      v6 = CFSTR("PDF document");
      goto LABEL_3;
    case 6:
      v12 = IMCommonCoreBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v5 = v4;
      v6 = CFSTR("Audiobook");
      goto LABEL_3;
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
      v3 = IMCommonCoreBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
      v5 = v4;
      v6 = CFSTR("Audiobook Track");
LABEL_3:
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_296430, CFSTR("BCCommonCoreLocalizable")));

      break;
    default:
      v7 = 0;
      break;
  }
  return v7;
}

+ (id)dictionaryRepresentationForAsset:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  id v102;

  v3 = a3;
  v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accountID"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accountID"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("accountID"));

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "assetID"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "assetID"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("assetID"));

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "temporaryAssetID"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "temporaryAssetID"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("temporaryAssetID"));

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "storeID"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "storeID"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("storeID"));

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "author"));

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "author"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("author"));

  }
  if ((objc_opt_respondsToSelector(v3, "authorCount") & 1) != 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "authorCount"));

    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "authorCount"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("authorCount"));

    }
  }
  if ((objc_opt_respondsToSelector(v3, "authorNames") & 1) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "authorNames"));

    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "authorNames"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, CFSTR("authorNames"));

    }
  }
  if ((objc_opt_respondsToSelector(v3, "hasTooManyAuthors") & 1) != 0)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hasTooManyAuthors"));

    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hasTooManyAuthors"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, CFSTR("hasTooManyAuthors"));

    }
  }
  if ((objc_opt_respondsToSelector(v3, "narratorCount") & 1) != 0)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "narratorCount"));

    if (v21)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "narratorCount"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, CFSTR("narratorCount"));

    }
  }
  if ((objc_opt_respondsToSelector(v3, "narratorNames") & 1) != 0)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "narratorNames"));

    if (v23)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "narratorNames"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v24, CFSTR("narratorNames"));

    }
  }
  if ((objc_opt_respondsToSelector(v3, "hasTooManyNarrators") & 1) != 0)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hasTooManyNarrators"));

    if (v25)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hasTooManyNarrators"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v26, CFSTR("hasTooManyNarrators"));

    }
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "title"));

  if (v27)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "title"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v28, CFSTR("title"));

  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sortTitle"));

  if (v29)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sortTitle"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v30, CFSTR("sortTitle"));

  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "url"));

  if (v31)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "url"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "absoluteString"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v33, CFSTR("url"));

  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "genre"));

  if (v34)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "genre"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v35, CFSTR("genre"));

  }
  if ((objc_opt_respondsToSelector(v3, "genres") & 1) != 0)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "genres"));

    if (v36)
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "genres"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v37, CFSTR("genres"));

    }
  }
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dataSourceIdentifier"));

  if (v38)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dataSourceIdentifier"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v39, CFSTR("dataSourceIdentifier"));

  }
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v3, "generation")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v40, CFSTR("generation"));

  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v3, "fileSize")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v41, CFSTR("fileSize"));

  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithShort:](NSNumber, "numberWithShort:", objc_msgSend(v3, "contentType")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v42, CFSTR("contentType"));

  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithShort:](NSNumber, "numberWithShort:", objc_msgSend(v3, "state")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v43, CFSTR("state"));

  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dataSourceInsertionDate"));
  if (v44)
  {
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dataSourceInsertionDate"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v45, CFSTR("dataSourceInsertionDate"));

  }
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "releaseDate"));

  if (v46)
  {
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "releaseDate"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v47, CFSTR("releaseDate"));

  }
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "purchaseDate"));

  if (v48)
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "purchaseDate"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v49, CFSTR("purchaseDate"));

  }
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "expectedDate"));

  if (v50)
  {
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "expectedDate"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v51, CFSTR("expectedDate"));

  }
  v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v3, "shouldDisableOptimizeSpeed")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v52, CFSTR("shouldDisableOptimizeSpeed"));

  v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v3, "shouldDisableTouchEmulation")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v53, CFSTR("shouldDisableTouchEmulation"));

  v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithShort:](NSNumber, "numberWithShort:", objc_msgSend(v3, "desktopSupportLevel")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v54, CFSTR("desktopSupportLevel"));

  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "scrollDirection"));
  if (v55)
  {
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "scrollDirection"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v56, CFSTR("scrollDirection"));

  }
  v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v3, "pageCount")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v57, CFSTR("pageCount"));

  v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v3, "rating")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v58, CFSTR("rating"));

  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "updateDate"));
  if (v59)
  {
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "updateDate"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v60, CFSTR("updateDate"));

  }
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "versionNumber"));

  if (v61)
  {
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "versionNumber"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v62, CFSTR("versionNumber"));

  }
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bookDescription"));

  if (v63)
  {
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bookDescription"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v64, CFSTR("bookDescription"));

  }
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "comments"));

  if (v65)
  {
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "comments"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v66, CFSTR("comments"));

  }
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "kind"));

  if (v67)
  {
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "kind"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v68, CFSTR("kind"));

  }
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "year"));

  if (v69)
  {
    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "year"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v70, CFSTR("year"));

  }
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "grouping"));

  if (v71)
  {
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "grouping"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v72, CFSTR("grouping"));

  }
  v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v3, "computedRating")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v73, CFSTR("computedRating"));

  v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v3, "metadataMigrationVersion")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v74, CFSTR("metadataMigrationVersion"));

  if ((objc_opt_respondsToSelector(v3, "assetIsHidden") & 1) != 0)
  {
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "assetIsHidden"));

    if (v75)
    {
      v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "assetIsHidden"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v76, CFSTR("assetIsHidden"));

    }
  }
  if ((objc_opt_respondsToSelector(v3, "storeFrontID") & 1) != 0)
  {
    v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v3, "storeFrontID")));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v77, CFSTR("storeFrontID"));

  }
  if ((objc_opt_respondsToSelector(v3, "coverAspectRatio") & 1) != 0)
  {
    v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "coverAspectRatio"));

    if (v78)
    {
      v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "coverAspectRatio"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v79, CFSTR("coverAspectRatio"));

    }
  }
  if ((objc_opt_respondsToSelector(v3, "seriesIsHidden") & 1) != 0)
  {
    v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "seriesIsHidden"));

    if (v80)
    {
      v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "seriesIsHidden"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v81, CFSTR("seriesIsHidden"));

    }
  }
  if ((objc_opt_respondsToSelector(v3, "seriesIsCloudOnly") & 1) != 0)
  {
    v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "seriesIsCloudOnly"));

    if (v82)
    {
      v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "seriesIsCloudOnly"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v83, CFSTR("seriesIsCloudOnly"));

    }
  }
  if ((objc_opt_respondsToSelector(v3, "seriesIsOrdered") & 1) != 0)
  {
    v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "seriesIsOrdered"));

    if (v84)
    {
      v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "seriesIsOrdered"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v85, CFSTR("seriesIsOrdered"));

    }
  }
  if ((objc_opt_respondsToSelector(v3, "sequenceDisplayName") & 1) != 0)
  {
    v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sequenceDisplayName"));

    if (v86)
    {
      v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sequenceDisplayName"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v87, CFSTR("sequenceDisplayName"));

    }
  }
  if ((objc_opt_respondsToSelector(v3, "sequenceNumber") & 1) != 0)
  {
    v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sequenceNumber"));

    if (v88)
    {
      v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sequenceNumber"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v89, CFSTR("sequenceNumber"));

    }
  }
  if ((objc_opt_respondsToSelector(v3, "seriesID") & 1) != 0)
  {
    v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "seriesID"));

    if (v90)
    {
      v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "seriesID"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v91, CFSTR("seriesID"));

    }
  }
  if ((objc_opt_respondsToSelector(v3, "isStoreAudiobook") & 1) != 0)
  {
    v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "isStoreAudiobook"));

    if (v92)
    {
      v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "isStoreAudiobook"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v93, CFSTR("isStoreAudiobook"));

    }
  }
  if ((objc_opt_respondsToSelector(v3, "mappedAssetID") & 1) != 0)
  {
    v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mappedAssetID"));

    if (v94)
    {
      v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mappedAssetID"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v95, CFSTR("mappedAssetID"));

    }
  }
  v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithShort:](NSNumber, "numberWithShort:", objc_msgSend(v3, "mappedAssetContentType")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v96, CFSTR("mappedAssetContentType"));

  if ((objc_opt_respondsToSelector(v3, "hasRACSupport") & 1) != 0)
  {
    v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hasRACSupport"));

    if (v97)
    {
      v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hasRACSupport"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v98, CFSTR("hasRACSupport"));

    }
  }
  if ((objc_opt_respondsToSelector(v3, "isSupplementalContent") & 1) != 0)
  {
    v99 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v3, "isSupplementalContent")));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v99, CFSTR("isSupplementalContent"));

  }
  if ((objc_opt_respondsToSelector(v3, "storePlaylistID") & 1) != 0)
  {
    v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "storePlaylistID"));

    if (v100)
    {
      v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "storePlaylistID"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v101, CFSTR("storePlaylistID"));

    }
  }
  v102 = v4;

  return v102;
}

+ (id)descriptionForAsset:(id)a3
{
  id v3;
  objc_class *v4;
  NSString *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  void *v106;
  void *v107;
  unsigned int v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  id v113;
  id v114;
  uint64_t v115;
  void *i;
  uint64_t v117;
  void *v118;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  _BYTE v124[128];

  v3 = a3;
  v4 = (objc_class *)objc_opt_class(v3);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("\n%@: <%p>"), v6, v3));

  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "assetID"));
  v9 = (void *)v8;
  if (v8)
    objc_msgSend(v7, "appendFormat:", CFSTR("\n\t%@ :  %@"), CFSTR("assetID"), v8);

  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "title"));
  v11 = (void *)v10;
  if (v10)
    objc_msgSend(v7, "appendFormat:", CFSTR("\n\t%@ :  %@"), CFSTR("title"), v10);

  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sortTitle"));
  v13 = (void *)v12;
  if (v12)
    objc_msgSend(v7, "appendFormat:", CFSTR("\n\t%@ :  %@"), CFSTR("sortTitle"), v12);

  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "author"));
  v15 = (void *)v14;
  if (v14)
    objc_msgSend(v7, "appendFormat:", CFSTR("\n\t%@ :  %@"), CFSTR("author"), v14);

  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sortAuthor"));
  v17 = (void *)v16;
  if (v16)
    objc_msgSend(v7, "appendFormat:", CFSTR("\n\t%@ :  %@"), CFSTR("sortAuthor"), v16);

  v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "storeID"));
  v19 = (void *)v18;
  if (v18)
    objc_msgSend(v7, "appendFormat:", CFSTR("\n\t%@ :  %@"), CFSTR("storeID"), v18);

  v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "temporaryAssetID"));
  v21 = (void *)v20;
  if (v20)
    objc_msgSend(v7, "appendFormat:", CFSTR("\n\t%@ :  %@"), CFSTR("temporaryAssetID"), v20);

  v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accountID"));
  v23 = (void *)v22;
  if (v22)
    objc_msgSend(v7, "appendFormat:", CFSTR("\n\t%@ :  %@"), CFSTR("accountID"), v22);

  if (objc_msgSend(v3, "contentType"))
  {
    v24 = BKStringFromAssetContentType(objc_msgSend(v3, "contentType"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    objc_msgSend(v7, "appendFormat:", CFSTR("\n\tcontentType :  %@"), v25);

  }
  if (objc_msgSend(v3, "state"))
  {
    v26 = objc_msgSend(v3, "state");
    if (v26 > 6)
      v27 = 0;
    else
      v27 = (uint64_t)*(&off_28FE78 + (int)v26);
    objc_msgSend(v7, "appendFormat:", CFSTR("\n\tstate :  %@"), v27);
  }
  v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "genre"));
  v29 = (void *)v28;
  if (v28)
    objc_msgSend(v7, "appendFormat:", CFSTR("\n\t%@ :  %@"), CFSTR("genre"), v28);

  v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dataSourceIdentifier"));
  v31 = (void *)v30;
  if (v30)
    objc_msgSend(v7, "appendFormat:", CFSTR("\n\t%@ :  %@"), CFSTR("dataSourceIdentifier"), v30);

  v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bookDescription"));
  v33 = (void *)v32;
  if (v32)
    objc_msgSend(v7, "appendFormat:", CFSTR("\n\t%@ :  %@"), CFSTR("bookDescription"), v32);

  v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "comments"));
  v35 = (void *)v34;
  if (v34)
    objc_msgSend(v7, "appendFormat:", CFSTR("\n\t%@ :  %@"), CFSTR("comments"), v34);

  v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "kind"));
  v37 = (void *)v36;
  if (v36)
    objc_msgSend(v7, "appendFormat:", CFSTR("\n\t%@ :  %@"), CFSTR("kind"), v36);

  v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "isExplicit"));
  v39 = (void *)v38;
  if (v38)
    objc_msgSend(v7, "appendFormat:", CFSTR("\n\t%@ :  %@"), CFSTR("isExplicit"), v38);

  v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "year"));
  v41 = (void *)v40;
  if (v40)
    objc_msgSend(v7, "appendFormat:", CFSTR("\n\t%@ :  %@"), CFSTR("year"), v40);

  v42 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "versionNumber"));
  v43 = (void *)v42;
  if (v42)
    objc_msgSend(v7, "appendFormat:", CFSTR("\n\t%@ :  %@"), CFSTR("versionNumber"), v42);

  v44 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "versionNumberHumanReadable"));
  v45 = (void *)v44;
  if (v44)
    objc_msgSend(v7, "appendFormat:", CFSTR("\n\t%@ :  %@"), CFSTR("versionNumberHumanReadable"), v44);

  v46 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dataSourceInsertionDate"));
  v47 = (void *)v46;
  if (v46)
    objc_msgSend(v7, "appendFormat:", CFSTR("\n\t%@ :  %@"), CFSTR("dataSourceInsertionDate"), v46);

  v48 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "releaseDate"));
  v49 = (void *)v48;
  if (v48)
    objc_msgSend(v7, "appendFormat:", CFSTR("\n\t%@ :  %@"), CFSTR("releaseDate"), v48);

  v50 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "purchaseDate"));
  v51 = (void *)v50;
  if (v50)
    objc_msgSend(v7, "appendFormat:", CFSTR("\n\t%@ :  %@"), CFSTR("purchaseDate"), v50);

  v52 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "expectedDate"));
  v53 = (void *)v52;
  if (v52)
    objc_msgSend(v7, "appendFormat:", CFSTR("\n\t%@ :  %@"), CFSTR("expectedDate"), v52);

  v54 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastOpenDate"));
  v55 = (void *)v54;
  if (v54)
    objc_msgSend(v7, "appendFormat:", CFSTR("\n\t%@ :  %@"), CFSTR("lastOpenDate"), v54);

  v56 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "updateDate"));
  v57 = (void *)v56;
  if (v56)
    objc_msgSend(v7, "appendFormat:", CFSTR("\n\t%@ :  %@"), CFSTR("updateDate"), v56);

  v58 = objc_msgSend(v3, "generation");
  sub_93D1C((uint64_t)v58, v7, (uint64_t)v58, CFSTR("generation"));
  v59 = objc_msgSend(v3, "fileSize");
  sub_93D1C((uint64_t)v59, v7, (uint64_t)v59, CFSTR("fileSize"));
  v60 = objc_msgSend(v3, "pageCount");
  sub_93D1C((uint64_t)v60, v7, (uint64_t)v60, CFSTR("pageCount"));
  v61 = objc_msgSend(v3, "rating");
  sub_93D1C((uint64_t)v61, v7, (uint64_t)v61, CFSTR("rating"));
  if (objc_msgSend(v3, "isSample"))
    objc_msgSend(v7, "appendFormat:", CFSTR("\n\t%@ :  YES"), CFSTR("sample"));
  if (objc_msgSend(v3, "isProof"))
    objc_msgSend(v7, "appendFormat:", CFSTR("\n\t%@ :  YES"), CFSTR("proof"));
  if (objc_msgSend(v3, "isCompressed"))
    objc_msgSend(v7, "appendFormat:", CFSTR("\n\t%@ :  YES"), CFSTR("compressed"));
  if (objc_msgSend(v3, "isLocked"))
    objc_msgSend(v7, "appendFormat:", CFSTR("\n\t%@ :  YES"), CFSTR("locked"));
  if (objc_msgSend(v3, "isEphemeral"))
    objc_msgSend(v7, "appendFormat:", CFSTR("\n\t%@ :  YES"), CFSTR("ephemeral"));
  if ((objc_opt_respondsToSelector(v3, "storeFrontID") & 1) != 0)
  {
    v62 = objc_msgSend(v3, "storeFrontID");
    sub_93D1C((uint64_t)v62, v7, (uint64_t)v62, CFSTR("storeFrontID"));
  }
  if ((objc_opt_respondsToSelector(v3, "assetIsHidden") & 1) != 0)
  {
    v63 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "assetIsHidden"));
    v64 = (void *)v63;
    if (v63)
      objc_msgSend(v7, "appendFormat:", CFSTR("\n\t%@ :  %@"), CFSTR("assetIsHidden"), v63);

  }
  if ((objc_opt_respondsToSelector(v3, "coverAspectRatio") & 1) != 0)
  {
    v65 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "coverAspectRatio"));
    v66 = (void *)v65;
    if (v65)
      objc_msgSend(v7, "appendFormat:", CFSTR("\n\t%@ :  %@"), CFSTR("coverAspectRatio"), v65);

  }
  if ((objc_opt_respondsToSelector(v3, "seriesIsHidden") & 1) != 0)
  {
    v67 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "seriesIsHidden"));
    v68 = (void *)v67;
    if (v67)
      objc_msgSend(v7, "appendFormat:", CFSTR("\n\t%@ :  %@"), CFSTR("seriesIsHidden"), v67);

  }
  if ((objc_opt_respondsToSelector(v3, "seriesIsCloudOnly") & 1) != 0)
  {
    v69 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "seriesIsCloudOnly"));
    v70 = (void *)v69;
    if (v69)
      objc_msgSend(v7, "appendFormat:", CFSTR("\n\t%@ :  %@"), CFSTR("seriesIsCloudOnly"), v69);

  }
  if ((objc_opt_respondsToSelector(v3, "seriesIsOrdered") & 1) != 0)
  {
    v71 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "seriesIsOrdered"));
    v72 = (void *)v71;
    if (v71)
      objc_msgSend(v7, "appendFormat:", CFSTR("\n\t%@ :  %@"), CFSTR("seriesIsOrdered"), v71);

  }
  if ((objc_opt_respondsToSelector(v3, "seriesSortKey") & 1) != 0)
  {
    v73 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "seriesSortKey"));
    v74 = (void *)v73;
    if (v73)
      objc_msgSend(v7, "appendFormat:", CFSTR("\n\t%@ :  %@"), CFSTR("seriesSortKey"), v73);

  }
  if ((objc_opt_respondsToSelector(v3, "sequenceDisplayName") & 1) != 0)
  {
    v75 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sequenceDisplayName"));
    v76 = (void *)v75;
    if (v75)
      objc_msgSend(v7, "appendFormat:", CFSTR("\n\t%@ :  %@"), CFSTR("sequenceDisplayName"), v75);

  }
  if ((objc_opt_respondsToSelector(v3, "seriesID") & 1) != 0)
  {
    v77 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "seriesID"));
    v78 = (void *)v77;
    if (v77)
      objc_msgSend(v7, "appendFormat:", CFSTR("\n\t%@ :  %@"), CFSTR("seriesID"), v77);

  }
  if ((objc_opt_respondsToSelector(v3, "permlink") & 1) != 0)
  {
    v79 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "permlink"));
    v80 = (void *)v79;
    if (v79)
      objc_msgSend(v7, "appendFormat:", CFSTR("\n\t%@ :  %@"), CFSTR("permlink"), v79);

  }
  if ((objc_opt_respondsToSelector(v3, "isStoreAudiobook") & 1) != 0)
  {
    v81 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "isStoreAudiobook"));
    v82 = (void *)v81;
    if (v81)
      objc_msgSend(v7, "appendFormat:", CFSTR("\n\t%@ :  %@"), CFSTR("isStoreAudiobook"), v81);

  }
  if ((objc_opt_respondsToSelector(v3, "isSupplementalContent") & 1) != 0
    && objc_msgSend(v3, "isSupplementalContent"))
  {
    objc_msgSend(v7, "appendFormat:", CFSTR("\n\t%@ :  YES"), CFSTR("supplementalContent"));
  }
  if ((objc_opt_respondsToSelector(v3, "storePlaylistID") & 1) != 0)
  {
    v83 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "storePlaylistID"));
    v84 = (void *)v83;
    if (v83)
      objc_msgSend(v7, "appendFormat:", CFSTR("\n\t%@ :  %@"), CFSTR("storePlaylistID"), v83);

  }
  if ((objc_opt_respondsToSelector(v3, "hasRACSupport") & 1) != 0)
  {
    v85 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hasRACSupport"));
    v86 = (void *)v85;
    if (v85)
      objc_msgSend(v7, "appendFormat:", CFSTR("\n\t%@ :  %@"), CFSTR("hasRACSupport"), v85);

  }
  if ((objc_opt_respondsToSelector(v3, "genres") & 1) != 0)
  {
    v87 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "genres"));
    v88 = (void *)v87;
    if (v87)
      objc_msgSend(v7, "appendFormat:", CFSTR("\n\t%@ :  %@"), CFSTR("genres"), v87);

  }
  if ((objc_opt_respondsToSelector(v3, "authorCount") & 1) != 0)
  {
    v89 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "authorCount"));
    v90 = (void *)v89;
    if (v89)
      objc_msgSend(v7, "appendFormat:", CFSTR("\n\t%@ :  %@"), CFSTR("authorCount"), v89);

  }
  if ((objc_opt_respondsToSelector(v3, "authorNames") & 1) != 0)
  {
    v91 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "authorNames"));
    v92 = (void *)v91;
    if (v91)
      objc_msgSend(v7, "appendFormat:", CFSTR("\n\t%@ :  %@"), CFSTR("authorNames"), v91);

  }
  if ((objc_opt_respondsToSelector(v3, "hasTooManyAuthors") & 1) != 0)
  {
    v93 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hasTooManyAuthors"));
    v94 = (void *)v93;
    if (v93)
      objc_msgSend(v7, "appendFormat:", CFSTR("\n\t%@ :  %@"), CFSTR("hasTooManyAuthors"), v93);

  }
  if ((objc_opt_respondsToSelector(v3, "narratorCount") & 1) != 0)
  {
    v95 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "narratorCount"));
    v96 = (void *)v95;
    if (v95)
      objc_msgSend(v7, "appendFormat:", CFSTR("\n\t%@ :  %@"), CFSTR("narratorCount"), v95);

  }
  if ((objc_opt_respondsToSelector(v3, "narratorNames") & 1) != 0)
  {
    v97 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "narratorNames"));
    v98 = (void *)v97;
    if (v97)
      objc_msgSend(v7, "appendFormat:", CFSTR("\n\t%@ :  %@"), CFSTR("narratorNames"), v97);

  }
  if ((objc_opt_respondsToSelector(v3, "hasTooManyNarrators") & 1) != 0)
  {
    v99 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hasTooManyNarrators"));
    v100 = (void *)v99;
    if (v99)
      objc_msgSend(v7, "appendFormat:", CFSTR("\n\t%@ :  %@"), CFSTR("hasTooManyNarrators"), v99);

  }
  if ((objc_opt_respondsToSelector(v3, "mappedAssetID") & 1) != 0)
  {
    v101 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mappedAssetID"));
    v102 = (void *)v101;
    if (v101)
      objc_msgSend(v7, "appendFormat:", CFSTR("\n\t%@ :  %@"), CFSTR("mappedAssetID"), v101);

  }
  if ((objc_opt_respondsToSelector(v3, "mappedAssetContentType") & 1) != 0)
  {
    v103 = BKStringFromAssetContentType(objc_msgSend(v3, "mappedAssetContentType"));
    v104 = (void *)objc_claimAutoreleasedReturnValue(v103);
    objc_msgSend(v7, "appendFormat:", CFSTR("\n\tmappedAssetContentType :  %@"), v104);

  }
  v105 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "url"));
  v106 = (void *)v105;
  if (v105)
    objc_msgSend(v7, "appendFormat:", CFSTR("\n\t%@ :  %@"), CFSTR("url"), v105);

  v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "url"));
  v108 = objc_msgSend(v107, "isFileURL");

  if (v108)
  {
    v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "url"));
    v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "url"));
    v111 = (void *)objc_claimAutoreleasedReturnValue(+[BCUbiquityMetadataHelper ubiquityMetadataForURL:options:needsCoordination:](BCUbiquityMetadataHelper, "ubiquityMetadataForURL:options:needsCoordination:", v109, -262145, objc_msgSend(v110, "bc_isUbiquitous")));

    if (objc_msgSend(v111, "count"))
    {
      objc_msgSend(v7, "appendFormat:", CFSTR("\n\txattr metadata : "));
      v122 = 0u;
      v123 = 0u;
      v120 = 0u;
      v121 = 0u;
      v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "allKeys"));
      v113 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v120, v124, 16);
      if (v113)
      {
        v114 = v113;
        v115 = *(_QWORD *)v121;
        do
        {
          for (i = 0; i != v114; i = (char *)i + 1)
          {
            if (*(_QWORD *)v121 != v115)
              objc_enumerationMutation(v112);
            v117 = *(_QWORD *)(*((_QWORD *)&v120 + 1) + 8 * (_QWORD)i);
            v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "objectForKey:", v117));
            objc_msgSend(v7, "appendFormat:", CFSTR("\n\t\t\t%@: %@"), v117, v118);

          }
          v114 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v120, v124, 16);
        }
        while (v114);
      }

    }
  }
  objc_msgSend(v7, "appendFormat:", CFSTR("\n"));

  return v7;
}

@end
