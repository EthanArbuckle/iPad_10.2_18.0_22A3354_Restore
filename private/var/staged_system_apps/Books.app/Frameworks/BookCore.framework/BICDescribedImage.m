@implementation BICDescribedImage

+ (id)groupDescribedImagesByIdentifier:(id)a3
{
  id v3;
  char *v4;
  char *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id v22;
  _BYTE v23[128];

  v3 = a3;
  v4 = (char *)objc_msgSend(v3, "count");
  v5 = v4;
  if ((unint64_t)v4 < 2)
  {
    if (v4 == (_BYTE *)&dword_0 + 1)
    {
      v22 = v3;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
    }
    else
    {
      v15 = &__NSArray0__struct;
    }
  }
  else
  {
    v6 = objc_alloc_init((Class)NSMutableDictionary);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v17 = v3;
    v7 = v3;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
          v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v13));
          if (!v14)
          {
            v14 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v5);
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, v13);
          }
          objc_msgSend(v14, "addObject:", v12);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v9);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allValues"));
    v3 = v17;
  }

  return v15;
}

+ (BICDescribedImage)describedImageWithIdentifier:(id)a3 size:(CGSize)a4 processingOptions:(unsigned __int16)a5
{
  uint64_t v5;
  id v6;
  int v7;
  id v8;
  id v9;
  NSObject *v10;
  BICDescribedImage *v11;
  id v13;
  CGSize v14;

  v5 = a5;
  v14 = a4;
  v6 = a3;
  v13 = 0;
  v7 = ClampImageSize((uint64_t)&v14, 1, &v13);
  v8 = v13;
  if (v7)
  {
    v9 = BCImageCacheLog();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1B96A8((uint64_t)v6, (uint64_t)v8, v10);

  }
  v11 = -[BICDescribedImage initWithIdentifier:]([BICDescribedImage alloc], "initWithIdentifier:", v6);
  -[BICDescribedImage setImageSize:](v11, "setImageSize:", v14.width, v14.height);
  -[BICDescribedImage setProcessingOptions:](v11, "setProcessingOptions:", v5);

  return v11;
}

+ (id)describedImagesToDictionaryOfSets:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier", (_QWORD)v14));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v11));
        if (!v12)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v11);
        }
        objc_msgSend(v12, "addObject:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)describedImageFromImageEntry:(id)a3
{
  id v3;
  BICDescribedImage *v4;
  void *v5;
  void *v6;
  BICDescribedImage *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;

  v3 = a3;
  v4 = [BICDescribedImage alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "imageSet"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  v7 = -[BICDescribedImage initWithIdentifier:](v4, "initWithIdentifier:", v6);

  objc_msgSend(v3, "imageSize");
  -[BICDescribedImage setImageSize:](v7, "setImageSize:");
  -[BICDescribedImage setProcessingOptions:](v7, "setProcessingOptions:", objc_msgSend(v3, "processingOptions"));
  -[BICDescribedImage setQuality:](v7, "setQuality:", objc_msgSend(v3, "quality"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastUsed"));
  -[BICDescribedImage setLastUsed:](v7, "setLastUsed:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "expiry"));
  -[BICDescribedImage setExpiry:](v7, "setExpiry:", v9);

  v10 = (double)objc_msgSend(v3, "shadowLeft");
  v11 = (double)objc_msgSend(v3, "shadowTop");
  v12 = (double)objc_msgSend(v3, "shadowWidth");
  LODWORD(v9) = objc_msgSend(v3, "shadowHeight");

  -[BICDescribedImage setNonShadowArea:](v7, "setNonShadowArea:", v10, v11, v12, (double)v9);
  return v7;
}

+ (id)describedImageFromEntryLocation:(id)a3
{
  void *v3;
  BICDescribedImage *v4;
  void *v5;
  BICDescribedImage *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("|")));
  v4 = [BICDescribedImage alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 0));
  v6 = -[BICDescribedImage initWithIdentifier:](v4, "initWithIdentifier:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 2));
  v8 = (double)(uint64_t)objc_msgSend(v7, "integerValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 3));
  -[BICDescribedImage setImageSize:](v6, "setImageSize:", v8, (double)(uint64_t)objc_msgSend(v9, "integerValue"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 4));
  -[BICDescribedImage setProcessingOptions:](v6, "setProcessingOptions:", (unsigned __int16)objc_msgSend(v10, "integerValue"));

  if ((unint64_t)objc_msgSend(v3, "count") >= 6)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 5));
    -[BICDescribedImage setQuality:](v6, "setQuality:", (unsigned __int16)objc_msgSend(v11, "integerValue"));

  }
  return v6;
}

+ (BICDescribedImage)describedImageWithPriority:(unint64_t)a3
{
  BICDescribedImage *v4;

  v4 = -[BICDescribedImage initWithIdentifier:]([BICDescribedImage alloc], "initWithIdentifier:", CFSTR("Prioritizer"));
  -[BICDescribedImage setPriority:](v4, "setPriority:", a3);
  return v4;
}

+ (id)stringForImageQuality:(unsigned __int16)a3
{
  id result;

  switch(a3)
  {
    case 'd':
      result = CFSTR("transformed");
      break;
    case 'e':
      result = CFSTR("transformed smaller");
      break;
    case 'f':
      result = CFSTR("transformed downloading");
      break;
    case 'g':
      result = CFSTR("transformed cloud");
      break;
    case 'h':
      result = CFSTR("transformed profile");
      break;
    case 'i':
      result = CFSTR("transformed book");
      break;
    case 'j':
      result = CFSTR("transformed book sample");
      break;
    case 'k':
      result = CFSTR("transformed book sample stashed");
      break;
    case 'l':
      result = CFSTR("transformed user");
      break;
    default:
      switch(a3)
      {
        case 0xC8u:
          result = CFSTR("not transformed");
          break;
        case 0xC9u:
          result = CFSTR("download");
          break;
        case 0xCAu:
          result = CFSTR("cloud");
          break;
        case 0xCBu:
          result = CFSTR("profile");
          break;
        case 0xCCu:
          result = CFSTR("book sample");
          break;
        case 0xCDu:
          result = CFSTR("book sample stashed");
          break;
        case 0xCEu:
          result = CFSTR("book");
          break;
        case 0xCFu:
          result = CFSTR("user");
          break;
        case 0xD0u:
          result = CFSTR("max");
          break;
        default:
          switch(a3)
          {
            case 0u:
              result = CFSTR("unknown");
              break;
            case 1u:
              result = CFSTR("blank");
              break;
            case 2u:
              result = CFSTR("generic");
              break;
            case 3u:
              result = CFSTR("old");
              break;
            default:
              result = 0;
              break;
          }
          break;
      }
      break;
  }
  return result;
}

+ (unsigned)transformedQualityFrom:(unsigned __int16)a3
{
  unsigned __int16 result;

  result = a3;
  if ((a3 - 100) >= 9)
  {
    switch(a3)
    {
      case 0xC8u:
      case 0xD0u:
        return result;
      case 0xC9u:
        result = 102;
        break;
      case 0xCAu:
        result = 103;
        break;
      case 0xCBu:
        result = 104;
        break;
      case 0xCCu:
        result = 106;
        break;
      case 0xCDu:
        result = 107;
        break;
      case 0xCEu:
        result = 105;
        break;
      case 0xCFu:
        result = 108;
        break;
      default:
        if (a3 >= 4u)
          result = 0;
        break;
    }
  }
  return result;
}

- (BICDescribedImage)initWithIdentifier:(id)a3
{
  id v4;
  BICDescribedImage *v5;
  BICDescribedImage *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BICDescribedImage;
  v5 = -[BICDescribedImage init](&v9, "init");
  v6 = v5;
  if (v5)
  {
    ++qword_311410;
    -[BICDescribedImage setGeneration:](v5, "setGeneration:");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
    -[BICDescribedImage setOperationsLog:](v6, "setOperationsLog:", v7);

  }
  -[BICDescribedImage setIdentifier:](v6, "setIdentifier:", v4);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BICDescribedImage *v4;
  void *v5;
  BICDescribedImage *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = [BICDescribedImage alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BICDescribedImage identifier](self, "identifier"));
  v6 = -[BICDescribedImage initWithIdentifier:](v4, "initWithIdentifier:", v5);

  -[BICDescribedImage setPriority:](v6, "setPriority:", -[BICDescribedImage priority](self, "priority"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BICDescribedImage filePath](self, "filePath"));
  -[BICDescribedImage setFilePath:](v6, "setFilePath:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BICDescribedImage urlString](self, "urlString"));
  -[BICDescribedImage setUrlString:](v6, "setUrlString:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BICDescribedImage adamID](self, "adamID"));
  -[BICDescribedImage setAdamID:](v6, "setAdamID:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BICDescribedImage image](self, "image"));
  -[BICDescribedImage setImage:](v6, "setImage:", v10);

  -[BICDescribedImage setProcessingOptions:](v6, "setProcessingOptions:", -[BICDescribedImage processingOptions](self, "processingOptions"));
  -[BICDescribedImage setRequestOptions:](v6, "setRequestOptions:", -[BICDescribedImage requestOptions](self, "requestOptions"));
  -[BICDescribedImage setQuality:](v6, "setQuality:", -[BICDescribedImage quality](self, "quality"));
  -[BICDescribedImage imageSize](self, "imageSize");
  -[BICDescribedImage setImageSize:](v6, "setImageSize:");
  -[BICDescribedImage setMatchScore:](v6, "setMatchScore:", -[BICDescribedImage matchScore](self, "matchScore"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BICDescribedImage title](self, "title"));
  -[BICDescribedImage setTitle:](v6, "setTitle:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BICDescribedImage author](self, "author"));
  -[BICDescribedImage setAuthor:](v6, "setAuthor:", v12);

  -[BICDescribedImage nonShadowArea](self, "nonShadowArea");
  -[BICDescribedImage setNonShadowArea:](v6, "setNonShadowArea:");
  -[BICDescribedImage setStackOutline:](v6, "setStackOutline:", -[BICDescribedImage stackOutline](self, "stackOutline"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BICDescribedImage lastUsed](self, "lastUsed"));
  -[BICDescribedImage setLastUsed:](v6, "setLastUsed:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BICDescribedImage expiry](self, "expiry"));
  -[BICDescribedImage setExpiry:](v6, "setExpiry:", v14);

  -[BICDescribedImage setUnknownAspectRatio:](v6, "setUnknownAspectRatio:", -[BICDescribedImage unknownAspectRatio](self, "unknownAspectRatio"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  -[BICDescribedImage setOperationsLog:](v6, "setOperationsLog:", v15);

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[BICDescribedImage setStackOutline:](self, "setStackOutline:", 0);
  v3.receiver = self;
  v3.super_class = (Class)BICDescribedImage;
  -[BICDescribedImage dealloc](&v3, "dealloc");
}

- (BOOL)isEqual:(id)a3
{
  BICDescribedImage *v4;
  uint64_t v5;
  BOOL v6;

  v4 = (BICDescribedImage *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class(BICDescribedImage);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
      v6 = -[BICDescribedImage isEqualToDescribedImage:](self, "isEqualToDescribedImage:", v4);
    else
      v6 = 0;
  }

  return v6;
}

- (BOOL)isEqualToDescribedImage:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  unsigned int v12;
  unsigned int v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;

  v4 = a3;
  -[BICDescribedImage imageSize](self, "imageSize");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "imageSize");
  v11 = v6 == v10 && v8 == v9;
  if (v11
    && (v12 = objc_msgSend(v4, "processingOptions"),
        v12 == -[BICDescribedImage processingOptions](self, "processingOptions"))
    && (v13 = objc_msgSend(v4, "quality"), v13 == -[BICDescribedImage quality](self, "quality")))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BICDescribedImage identifier](self, "identifier"));
    v16 = objc_msgSend(v14, "isEqualToString:", v15);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)setStackOutline:(CGPath *)a3
{
  CGPath *stackOutline;

  stackOutline = self->_stackOutline;
  if (stackOutline)
  {
    CFRelease(stackOutline);
    self->_stackOutline = 0;
  }
  if (a3)
    self->_stackOutline = CGPathCreateCopy(a3);
}

- (void)setAlternateRequest:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_alternateRequest, a3);
  v5 = a3;
  objc_msgSend(v5, "setPrimaryRequest:", self);

}

+ (id)identifierFromEntryLocation:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("|")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));

  return v4;
}

+ (id)entryLocationWithIdentifier:(id)a3 level:(signed __int16)a4 size:(CGSize)a5 options:(unsigned __int16)a6 quality:(unsigned __int16)a7
{
  NSString *v8;
  uint64_t v10;

  if (CGSizeZero.width == a5.width && CGSizeZero.height == a5.height)
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@|%d|%d|%d|%hd|%d"), a4, a6, a7, a3, a4, (int)a5.width, (int)a5.height, a6, a7);
  else
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@|%d|%d|%d|%hd"), a4, a6, a7, a3, a4, (int)a5.width, (int)a5.height, a6, v10);
  return (id)objc_claimAutoreleasedReturnValue(v8);
}

- (id)entryLocationForLevelID:(signed __int16)a3
{
  uint64_t v3;
  void *v5;
  double v6;
  double v7;
  void *v8;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BICDescribedImage identifier](self, "identifier"));
  -[BICDescribedImage imageSize](self, "imageSize");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[BICDescribedImage entryLocationWithIdentifier:level:size:options:quality:](BICDescribedImage, "entryLocationWithIdentifier:level:size:options:quality:", v5, v3, -[BICDescribedImage processingOptions](self, "processingOptions"), -[BICDescribedImage quality](self, "quality"), v6, v7));

  return v8;
}

- (NSString)description
{
  return (NSString *)-[BICDescribedImage _computeDescriptionIsFull:](self, "_computeDescriptionIsFull:", 1);
}

- (id)shortDescription
{
  return -[BICDescribedImage _computeDescriptionIsFull:](self, "_computeDescriptionIsFull:", 0);
}

- (id)_computeDescriptionIsFull:(BOOL)a3
{
  _BOOL4 v3;
  NSMutableArray *v5;
  void *v6;
  double v7;
  double v8;
  double v10;
  uint64_t v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;

  v3 = a3;
  v5 = objc_opt_new(NSMutableArray);
  -[NSMutableArray addObject:](v5, "addObject:", CFSTR("<image:"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BICDescribedImage identifier](self, "identifier"));
  -[NSMutableArray addObject:](v5, "addObject:", v6);

  -[BICDescribedImage imageSize](self, "imageSize");
  if (v8 != CGSizeZero.width || v7 != CGSizeZero.height)
  {
    -[BICDescribedImage imageSize](self, "imageSize");
    v11 = (int)v10;
    -[BICDescribedImage imageSize](self, "imageSize");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(",xy:%d,%d"), v11, (int)v12));
    -[NSMutableArray addObject:](v5, "addObject:", v13);

  }
  if (-[BICDescribedImage processingOptions](self, "processingOptions"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BICDescribedImage shortDescriptionOfProcessingOptions](self, "shortDescriptionOfProcessingOptions"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(",o:%@"), v14));
    -[NSMutableArray addObject:](v5, "addObject:", v15);

  }
  if (-[BICDescribedImage quality](self, "quality"))
  {
    v16 = objc_msgSend((id)objc_opt_class(self), "stringForImageQuality:", -[BICDescribedImage quality](self, "quality"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(",q:%@"), v17));
    -[NSMutableArray addObject:](v5, "addObject:", v18);

  }
  if (v3)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BICDescribedImage urlString](self, "urlString"));

    if (v19)
    {
      v20 = CFSTR(",url");
    }
    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[BICDescribedImage adamID](self, "adamID"));

      if (v21)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[BICDescribedImage adamID](self, "adamID"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(",adamID:%@"), v22));
        -[NSMutableArray addObject:](v5, "addObject:", v23);

        goto LABEL_16;
      }
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[BICDescribedImage image](self, "image"));

      if (!v31)
        goto LABEL_16;
      v20 = CFSTR(",cgImage");
    }
    -[NSMutableArray addObject:](v5, "addObject:", v20);
LABEL_16:
    if (-[BICDescribedImage matchScore](self, "matchScore"))
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(",rank:%lu"), -[BICDescribedImage matchScore](self, "matchScore")));
      -[NSMutableArray addObject:](v5, "addObject:", v24);

    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[BICDescribedImage operationsLog](self, "operationsLog"));
    v26 = objc_msgSend(v25, "length");

    if (v26)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[BICDescribedImage operationsLog](self, "operationsLog"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(",ops:%@"), v27));
      -[NSMutableArray addObject:](v5, "addObject:", v28);

    }
  }
  -[NSMutableArray addObject:](v5, "addObject:", CFSTR(">"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v5, "componentsJoinedByString:", &stru_296430));

  return v29;
}

- (id)shortDescriptionOfProcessingOptions
{
  void *v3;
  const __CFString *v4;
  const __CFString *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  if (!-[BICDescribedImage processingOptions](self, "processingOptions"))
  {
    v5 = CFSTR("none");
LABEL_26:
    objc_msgSend(v3, "appendString:", v5);
    return v3;
  }
  if ((-[BICDescribedImage processingOptions](self, "processingOptions") & 2) != 0)
  {
    v4 = CFSTR("book");
  }
  else if ((-[BICDescribedImage processingOptions](self, "processingOptions") & 4) != 0)
  {
    v4 = CFSTR("PDF");
  }
  else if ((-[BICDescribedImage processingOptions](self, "processingOptions") & 8) != 0)
  {
    v4 = CFSTR("audio");
  }
  else if ((-[BICDescribedImage processingOptions](self, "processingOptions") & 0x10) != 0)
  {
    v4 = CFSTR("shadow");
  }
  else
  {
    if ((-[BICDescribedImage processingOptions](self, "processingOptions") & 0x20) == 0)
      goto LABEL_14;
    v4 = CFSTR("stack");
  }
  objc_msgSend(v3, "appendString:", v4);
LABEL_14:
  if ((-[BICDescribedImage processingOptions](self, "processingOptions") & 0x40) != 0)
    objc_msgSend(v3, "appendString:", CFSTR("-night"));
  if ((-[BICDescribedImage processingOptions](self, "processingOptions") & 0x80) != 0)
    objc_msgSend(v3, "appendString:", CFSTR("-rtl"));
  if ((-[BICDescribedImage processingOptions](self, "processingOptions") & 0x100) != 0)
    objc_msgSend(v3, "appendString:", CFSTR("-binding"));
  if ((-[BICDescribedImage processingOptions](self, "processingOptions") & 0x200) != 0)
    objc_msgSend(v3, "appendString:", CFSTR("-generic"));
  if ((-[BICDescribedImage processingOptions](self, "processingOptions") & 0x400) != 0)
    objc_msgSend(v3, "appendString:", CFSTR("-restricted"));
  if ((-[BICDescribedImage processingOptions](self, "processingOptions") & 0x10) != 0)
  {
    v5 = CFSTR("-shadow");
    goto LABEL_26;
  }
  return v3;
}

- (BOOL)seriesStack
{
  return (-[BICDescribedImage processingOptions](self, "processingOptions") >> 5) & 1;
}

- (BOOL)isExpired
{
  void *v3;
  void *v4;
  double v5;
  BOOL v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BICDescribedImage expiry](self, "expiry"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BICDescribedImage expiry](self, "expiry"));
    objc_msgSend(v4, "timeIntervalSinceNow");
    v6 = v5 < 0.0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isGeneric
{
  return (-[BICDescribedImage processingOptions](self, "processingOptions") & 0x200) != 0
      || -[BICDescribedImage quality](self, "quality") == 2;
}

- (BOOL)isAlternateGeneric
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BICDescribedImage alternateRequest](self, "alternateRequest"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BICDescribedImage alternateRequest](self, "alternateRequest"));
    v5 = objc_msgSend(v4, "isGeneric");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isGenericSeriesStack
{
  _BOOL4 v3;

  v3 = -[BICDescribedImage seriesStack](self, "seriesStack");
  if (v3)
    LOBYTE(v3) = (-[BICDescribedImage processingOptions](self, "processingOptions") & 0x200) != 0
              && -[BICDescribedImage quality](self, "quality") == 2;
  return v3;
}

- (BOOL)isSeriesStackWithGenerics
{
  _BOOL4 v3;

  v3 = -[BICDescribedImage seriesStack](self, "seriesStack");
  if (v3)
    LOBYTE(v3) = (-[BICDescribedImage processingOptions](self, "processingOptions") & 0x200) == 0
              && -[BICDescribedImage quality](self, "quality") == 2;
  return v3;
}

- (BOOL)isLowQuality
{
  return -[BICDescribedImage quality](self, "quality") == 3 || -[BICDescribedImage quality](self, "quality") == 101;
}

- (BOOL)isOldVersion
{
  return -[BICDescribedImage quality](self, "quality") == 3;
}

- (int64_t)costFor:(signed __int16)a3
{
  void *v4;
  CGImage *v5;
  size_t BytesPerRow;

  if (a3)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BICDescribedImage image](self, "image"));
  v5 = (CGImage *)objc_msgSend(v4, "CGImage");

  if (!v5)
    return 0;
  BytesPerRow = CGImageGetBytesPerRow(v5);
  CGImageGetWidth(v5);
  return (uint64_t)((double)BytesPerRow * (double)CGImageGetHeight(v5));
}

- (BOOL)requiresNetwork
{
  double v3;
  double v4;
  BOOL v6;
  void *v7;
  BOOL v8;
  BOOL v9;

  -[BICDescribedImage imageSize](self, "imageSize");
  v6 = CGSizeZero.width == v4 && CGSizeZero.height == v3 && -[BICDescribedImage quality](self, "quality") == 203;
  if (-[BICDescribedImage quality](self, "quality") == 203)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BICDescribedImage urlString](self, "urlString"));
    v8 = v7 != 0;

  }
  else
  {
    v8 = 0;
  }
  v9 = -[BICDescribedImage location](self, "location") == 4 || v8;
  return v6 || v9;
}

- (NSString)identifier
{
  return self->identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)generation
{
  return self->generation;
}

- (void)setGeneration:(unint64_t)a3
{
  self->generation = a3;
}

- (unint64_t)matchScore
{
  return self->matchScore;
}

- (void)setMatchScore:(unint64_t)a3
{
  self->matchScore = a3;
}

- (NSDate)lastUsed
{
  return self->lastUsed;
}

- (void)setLastUsed:(id)a3
{
  objc_storeStrong((id *)&self->lastUsed, a3);
}

- (NSString)filePath
{
  return self->filePath;
}

- (void)setFilePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)urlString
{
  return self->urlString;
}

- (void)setUrlString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)adamID
{
  return self->adamID;
}

- (void)setAdamID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BICImage)image
{
  return self->image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->image, a3);
}

- (unsigned)processingOptions
{
  return self->processingOptions;
}

- (void)setProcessingOptions:(unsigned __int16)a3
{
  self->processingOptions = a3;
}

- (unsigned)requestOptions
{
  return self->requestOptions;
}

- (void)setRequestOptions:(unsigned __int16)a3
{
  self->requestOptions = a3;
}

- (CGSize)imageSize
{
  double width;
  double height;
  CGSize result;

  width = self->imageSize.width;
  height = self->imageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  self->imageSize = a3;
}

- (signed)persistanceOptions
{
  return self->persistanceOptions;
}

- (void)setPersistanceOptions:(signed __int16)a3
{
  self->persistanceOptions = a3;
}

- (unint64_t)priority
{
  return self->priority;
}

- (void)setPriority:(unint64_t)a3
{
  self->priority = a3;
}

- (unsigned)quality
{
  return self->quality;
}

- (void)setQuality:(unsigned __int16)a3
{
  self->quality = a3;
}

- (CGRect)nonShadowArea
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->nonShadowArea.origin.x;
  y = self->nonShadowArea.origin.y;
  width = self->nonShadowArea.size.width;
  height = self->nonShadowArea.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setNonShadowArea:(CGRect)a3
{
  self->nonShadowArea = a3;
}

- (BOOL)unknownAspectRatio
{
  return self->unknownAspectRatio;
}

- (void)setUnknownAspectRatio:(BOOL)a3
{
  self->unknownAspectRatio = a3;
}

- (NSDate)expiry
{
  return self->expiry;
}

- (void)setExpiry:(id)a3
{
  objc_storeStrong((id *)&self->expiry, a3);
}

- (NSMutableString)operationsLog
{
  return self->operationsLog;
}

- (void)setOperationsLog:(id)a3
{
  objc_storeStrong((id *)&self->operationsLog, a3);
}

- (CGPath)stackOutline
{
  return self->_stackOutline;
}

- (unsigned)location
{
  return self->location;
}

- (void)setLocation:(unsigned __int16)a3
{
  self->location = a3;
}

- (BICDescribedImage)alternateRequest
{
  return self->_alternateRequest;
}

- (BICDescribedImage)primaryRequest
{
  return (BICDescribedImage *)objc_loadWeakRetained((id *)&self->primaryRequest);
}

- (void)setPrimaryRequest:(id)a3
{
  objc_storeWeak((id *)&self->primaryRequest, a3);
}

- (BICDescribedImage)stackRequest
{
  return (BICDescribedImage *)objc_loadWeakRetained((id *)&self->stackRequest);
}

- (void)setStackRequest:(id)a3
{
  objc_storeWeak((id *)&self->stackRequest, a3);
}

- (NSString)title
{
  return self->title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)author
{
  return self->author;
}

- (void)setAuthor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->author, 0);
  objc_storeStrong((id *)&self->title, 0);
  objc_destroyWeak((id *)&self->stackRequest);
  objc_destroyWeak((id *)&self->primaryRequest);
  objc_storeStrong((id *)&self->_alternateRequest, 0);
  objc_storeStrong((id *)&self->operationsLog, 0);
  objc_storeStrong((id *)&self->expiry, 0);
  objc_storeStrong((id *)&self->image, 0);
  objc_storeStrong((id *)&self->adamID, 0);
  objc_storeStrong((id *)&self->urlString, 0);
  objc_storeStrong((id *)&self->filePath, 0);
  objc_storeStrong((id *)&self->lastUsed, 0);
  objc_storeStrong((id *)&self->identifier, 0);
}

@end
