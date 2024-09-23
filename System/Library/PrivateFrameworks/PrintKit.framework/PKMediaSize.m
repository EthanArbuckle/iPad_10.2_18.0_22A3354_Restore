@implementation PKMediaSize

- (int)getThingType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;

  v4 = a3;
  -[PKCollectionSpecialization collection](self, "collection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_findAttribute0:valueTag:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = objc_msgSend(v6, "value_tag");
  else
    v7 = 0;

  return v7;
}

- (int)getInt:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;

  v4 = a3;
  -[PKCollectionSpecialization collection](self, "collection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_findAttribute0:valueTag:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "values");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integer");

  return v9;
}

- (_NSRange)getRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSUInteger v14;
  NSUInteger v15;
  uint64_t v16;
  _NSRange result;

  v4 = a3;
  -[PKCollectionSpecialization collection](self, "collection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_findAttribute0:valueTag:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (objc_msgSend(v6, "value_tag") == 33)
    {
      objc_msgSend(v6, "values");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
        objc_msgSend(v8, "range");
      else
        v16 = 0;

      v10 = (int)v16 - 1;
      v11 = SHIDWORD(v16) - (uint64_t)(int)v16;
    }
    else
    {
      objc_msgSend(v6, "values");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (int)objc_msgSend(v13, "integer");

      v11 = 1;
    }
  }
  else
  {
    v10 = 0;
    v11 = 0;
  }

  v14 = v10;
  v15 = v11;
  result.length = v15;
  result.location = v14;
  return result;
}

- (BOOL)hasValidIntegerTypesForXAndY
{
  return -[PKMediaSize getThingType:](self, "getThingType:", CFSTR("x-dimension")) == 33
      && -[PKMediaSize getThingType:](self, "getThingType:", CFSTR("y-dimension")) == 33;
}

- (int)xDimension
{
  return -[PKMediaSize getInt:](self, "getInt:", CFSTR("x-dimension"));
}

- (int)yDimension
{
  return -[PKMediaSize getInt:](self, "getInt:", CFSTR("y-dimension"));
}

- (BOOL)yDimensionIsRange
{
  return -[PKMediaSize getThingType:](self, "getThingType:", CFSTR("y-dimension")) == 51;
}

- (_NSRange)yRange
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = -[PKMediaSize getRange:](self, "getRange:", CFSTR("y-dimension"));
  result.length = v3;
  result.location = v2;
  return result;
}

- (id)userCodableDictionary
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[PKMediaSize xDimension](self, "xDimension"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("x-dimension"));

  if (-[PKMediaSize yDimensionIsRange](self, "yDimensionIsRange"))
  {
    v5 = (void *)MEMORY[0x24BDD1968];
    v6 = -[PKMediaSize yRange](self, "yRange");
    objc_msgSend(v5, "valueWithRange:", v6, v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[PKMediaSize yDimension](self, "yDimension"));
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("y-dimension"));

  return v3;
}

+ (id)mediaSizeWithWidth:(int)a3 height:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  PKMediaSize *v7;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "_addInteger:valueTag:name:value:", 0, 33, CFSTR("x-dimension"), v5);
  objc_msgSend(v6, "_addInteger:valueTag:name:value:", 0, 33, CFSTR("y-dimension"), v4);
  v7 = -[PKCollectionSpecialization initWithCollection:]([PKMediaSize alloc], "initWithCollection:", v6);

  return v7;
}

@end
