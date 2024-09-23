@implementation OADShapeGeometry

- (OADShapeGeometry)init
{
  OADShapeGeometry *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *mAdjustValues;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OADShapeGeometry;
  v2 = -[OADShapeGeometry init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    mAdjustValues = v2->mAdjustValues;
    v2->mAdjustValues = v3;

  }
  return v2;
}

- (void)setIsEscher:(BOOL)a3
{
  self->mIsEscher = a3;
}

- (id)adjustValues
{
  return self->mAdjustValues;
}

- (void)setAdjustValue:(int)a3 atIndex:(unsigned int)a4
{
  void *v6;
  id v7;

  v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", *(_QWORD *)&a4);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithLong:", a3);
  -[NSMutableDictionary setObject:forKey:](self->mAdjustValues, "setObject:forKey:", v6, v7);

}

- (BOOL)isEscher
{
  return self->mIsEscher;
}

- (int)adjustValueAtIndex:(unsigned int)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", *(_QWORD *)&a3);
  -[NSMutableDictionary objectForKey:](self->mAdjustValues, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "longValue");
  else
    v7 = 0;

  return v7;
}

- (int)type
{
  void *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OADShapeGeometry type]");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/OfficeArt/Dom/OADShapeGeometry.mm");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v2, v3, 23, 0, "Abstract method not overridden by %@", v5);

  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  v6 = (void *)MEMORY[0x24BDBCE88];
  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v9, "-[OADShapeGeometry type]");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], v10, 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v11);
}

- (id)equivalentCustomGeometry
{
  void *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OADShapeGeometry equivalentCustomGeometry]");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/OfficeArt/Dom/OADShapeGeometry.mm");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v2, v3, 28, 0, "Abstract method not overridden by %@", v5);

  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  v6 = (void *)MEMORY[0x24BDBCE88];
  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v9, "-[OADShapeGeometry equivalentCustomGeometry]");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], v10, 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v11);
}

- (BOOL)hasAdjustValueAtIndex:(unsigned int)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", *(_QWORD *)&a3);
  -[NSMutableDictionary objectForKey:](self->mAdjustValues, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = v5 != 0;

  return (char)self;
}

- (unint64_t)adjustValueCount
{
  return -[NSMutableDictionary count](self->mAdjustValues, "count");
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADShapeGeometry;
  -[OADShapeGeometry description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mAdjustValues, 0);
}

@end
