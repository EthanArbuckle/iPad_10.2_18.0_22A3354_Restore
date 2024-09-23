@implementation TSWPImageBulletProvider

+ (id)sharedInstance
{
  if (+[TSWPImageBulletProvider sharedInstance]::predicate != -1)
    dispatch_once(&+[TSWPImageBulletProvider sharedInstance]::predicate, &__block_literal_global_68);
  return (id)+[TSWPImageBulletProvider sharedInstance]::sharedInstance;
}

TSWPImageBulletProvider *__41__TSWPImageBulletProvider_sharedInstance__block_invoke()
{
  TSWPImageBulletProvider *result;

  result = objc_alloc_init(TSWPImageBulletProvider);
  +[TSWPImageBulletProvider sharedInstance]::sharedInstance = (uint64_t)result;
  return result;
}

- (NSArray)predefinedImages
{
  NSArray *result;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  result = &self->_images->super;
  if (!result)
  {
    v4 = -[TSWPImageBulletProvider p_predefinedImageNames](self, "p_predefinedImageNames");
    v5 = objc_msgSend(v4, "count");
    if (v5)
    {
      v6 = v5;
      self->_images = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v5);
      self->_filenames = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v6);
      v7 = -[TSWPImageBulletProvider p_pathToPredefinedImages](self, "p_pathToPredefinedImages");
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v8 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v19;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v19 != v10)
              objc_enumerationMutation(v4);
            v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v11);
            v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6AC8]), "initWithContentsOfFile:", objc_msgSend(v7, "stringByAppendingPathComponent:", v12));
            if (v13)
            {
              v14 = (void *)v13;
              v15 = (void *)objc_msgSend(v12, "copy");
              -[NSMutableArray addObject:](self->_images, "addObject:", v14);
              -[NSMutableArray addObject:](self->_filenames, "addObject:", v15);

            }
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v9);
      }
    }
    result = &self->_images->super;
    if (!result)
    {
      v16 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v17 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPImageBulletProvider predefinedImages]");
      objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPImageBulletProvider.mm"), 66, CFSTR("Empty predefined bullet image array."));
      result = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      self->_images = (NSMutableArray *)result;
    }
  }
  return result;
}

- (id)dataForDefaultImageBulletWithContext:(id)a3
{
  return -[TSWPImageBulletProvider dataForImageBullet:withContext:](self, "dataForImageBullet:withContext:", 0, a3);
}

- (id)dataForImageBullet:(id)a3 withContext:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id result;

  objc_opt_class();
  v7 = TSUDynamicCast();
  if (v7)
  {
LABEL_10:
    result = +[TSPData dataFromURL:context:](TSPData, "dataFromURL:context:", v7, a4);
    if (result)
      return result;
    return +[TSWPListStyle defaultMissingBulletImage](TSWPListStyle, "defaultMissingBulletImage", v7);
  }
  objc_opt_class();
  v8 = TSUDynamicCast();
  if (v8)
    goto LABEL_9;
  if (!-[NSArray count](-[TSWPImageBulletProvider predefinedImages](self, "predefinedImages"), "count"))
    return +[TSWPListStyle defaultMissingBulletImage](TSWPListStyle, "defaultMissingBulletImage", v7);
  if (!a3)
    goto LABEL_7;
  v9 = -[NSMutableArray indexOfObject:](self->_images, "indexOfObject:", a3);
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPImageBulletProvider dataForImageBullet:withContext:]");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPImageBulletProvider.mm"), 104, CFSTR("Unknown image - TSPData requires path to image file"));
LABEL_7:
    v9 = 0;
  }
  v8 = objc_msgSend(-[TSWPImageBulletProvider p_pathToPredefinedImages](self, "p_pathToPredefinedImages"), "stringByAppendingPathComponent:", -[NSMutableArray objectAtIndexedSubscript:](self->_filenames, "objectAtIndexedSubscript:", v9));
LABEL_9:
  v7 = objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v8, 0);
  if (v7)
    goto LABEL_10;
  return +[TSWPListStyle defaultMissingBulletImage](TSWPListStyle, "defaultMissingBulletImage", v7);
}

- (id)p_pathToPredefinedImages
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle"), "resourcePath"), "stringByAppendingPathComponent:", CFSTR("ImageBullets"));
}

- (id)p_predefinedImageNames
{
  uint64_t v2;

  v2 = objc_msgSend(-[TSWPImageBulletProvider p_pathToPredefinedImages](self, "p_pathToPredefinedImages"), "stringByAppendingPathComponent:", CFSTR("ImageBullets.plist"));
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithContentsOfURL:", objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v2, 0));
}

@end
