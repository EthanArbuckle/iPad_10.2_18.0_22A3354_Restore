@implementation CRLEditableBezierPathSourceMorphInfo

- (CRLEditableBezierPathSourceMorphInfo)initWithEditableBezierPathSource:(id)a3
{
  id v4;
  CRLEditableBezierPathSourceMorphInfo *v5;
  id v6;
  id v7;
  NSMapTable *v8;
  NSMapTable *mOriginalNodeIndexMapping;
  void *v10;
  char *v11;
  char *v12;
  CFArrayRef (__cdecl **v13)(CTFontDescriptorRef, CFSetRef);
  void *v14;
  void *v15;
  void *v16;
  char *v17;
  char *v18;
  NSMapTable *v19;
  void *v20;
  void *v21;
  CFArrayRef (__cdecl **v22)(CTFontDescriptorRef, CFSetRef);
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  id v28;
  char *v29;
  void *v30;
  char *v31;
  char *v32;
  objc_super v33;
  _QWORD v34[2];

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)CRLEditableBezierPathSourceMorphInfo;
  v5 = -[CRLEditableBezierPathSourceMorphInfo init](&v33, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    v7 = objc_msgSend(v4, "copy");
    objc_msgSend(v7, "updateSmoothNodes");
    v27 = v6;
    objc_storeStrong((id *)&v5->mOriginal, v6);
    v26 = v7;
    objc_storeStrong((id *)&v5->mSmoothOriginal, v7);
    v8 = (NSMapTable *)objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 0);
    mOriginalNodeIndexMapping = v5->mOriginalNodeIndexMapping;
    v5->mOriginalNodeIndexMapping = v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subpaths"));
    v11 = (char *)objc_msgSend(v10, "count");

    v29 = v11;
    if (v11)
    {
      v12 = 0;
      v13 = &CTFontDescriptorCreateMatchingFontDescriptors_ptr;
      v28 = v4;
      do
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subpaths", v26, v27));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", v12));

        v30 = v15;
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "nodes"));
        v17 = (char *)objc_msgSend(v16, "count");
        if (v17)
        {
          v18 = 0;
          v31 = v17;
          v32 = v12;
          do
          {
            v19 = v5->mOriginalNodeIndexMapping;
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13[427], "numberWithUnsignedInteger:", v12));
            v34[0] = v20;
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13[427], "numberWithUnsignedInteger:", v18));
            v34[1] = v21;
            v22 = v13;
            v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v34, 2));
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndexedSubscript:", v18));
            -[NSMapTable setObject:forKey:](v19, "setObject:forKey:", v23, v24);

            v13 = v22;
            v12 = v32;
            ++v18;
          }
          while (v31 != v18);
        }

        ++v12;
        v4 = v28;
      }
      while (v12 != v29);
    }

  }
  return v5;
}

- (id)originalNodeForNode:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKeyedSubscript:](self->mOriginalNodeIndexMapping, "objectForKeyedSubscript:", a3));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self->mOriginal, "subpaths"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", 0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v6, "unsignedIntegerValue")));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "nodes"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", 1));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v9, "unsignedIntegerValue")));

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)originalSubpathIndexForNode:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKeyedSubscript:](self->mOriginalNodeIndexMapping, "objectForKeyedSubscript:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 0));
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  return (unint64_t)v5;
}

- (unint64_t)originalNodeIndexForNode:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKeyedSubscript:](self->mOriginalNodeIndexMapping, "objectForKeyedSubscript:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 1));
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  return (unint64_t)v5;
}

- (id)originalSmoothNodeForNode:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKeyedSubscript:](self->mOriginalNodeIndexMapping, "objectForKeyedSubscript:", a3));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditableBezierPathSource subpaths](self->mSmoothOriginal, "subpaths"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", 0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v6, "unsignedIntegerValue")));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "nodes"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", 1));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v9, "unsignedIntegerValue")));

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (CRLEditableBezierPathSource)original
{
  return self->mOriginal;
}

- (void)setOriginal:(id)a3
{
  objc_storeStrong((id *)&self->mOriginal, a3);
}

- (CRLEditableBezierPathSource)smoothOriginal
{
  return self->mSmoothOriginal;
}

- (void)setSmoothOriginal:(id)a3
{
  objc_storeStrong((id *)&self->mSmoothOriginal, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mOriginalNodeIndexMapping, 0);
  objc_storeStrong((id *)&self->mSmoothOriginal, 0);
  objc_storeStrong((id *)&self->mOriginal, 0);
}

@end
