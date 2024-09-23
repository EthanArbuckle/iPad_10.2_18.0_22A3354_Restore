@implementation CRLPdfTagger

- (CRLPdfTagger)init
{
  CRLPdfTagger *v2;
  CRLPdfTagger *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLPdfTagger;
  v2 = -[CRLPdfTagger init](&v5, "init");
  v3 = v2;
  if (v2)
    -[CRLPdfTagger setUp](v2, "setUp");
  return v3;
}

- (void)setUp
{
  NSMutableArray *v3;
  NSMutableArray *contextStack;
  NSMutableArray *v5;
  NSMutableArray *tagStack;
  NSMutableArray *v7;
  NSMutableArray *paragraphLevelResolverStack;
  CRLPdfTaggerListParagraphLevelResolver *v9;
  CRLPdfTagInfo *v10;

  self->_stateIsValid = 1;
  v3 = objc_opt_new(NSMutableArray);
  contextStack = self->_contextStack;
  self->_contextStack = v3;

  v5 = objc_opt_new(NSMutableArray);
  tagStack = self->_tagStack;
  self->_tagStack = v5;

  v10 = -[CRLPdfTagInfo initWithTagType:tagProperties:]([CRLPdfTagInfo alloc], "initWithTagType:tagProperties:", 0, 0);
  -[NSMutableArray crl_push:](self->_tagStack, "crl_push:");
  v7 = objc_opt_new(NSMutableArray);
  paragraphLevelResolverStack = self->_paragraphLevelResolverStack;
  self->_paragraphLevelResolverStack = v7;

  v9 = -[CRLPdfTaggerParagraphLevelResolver initWithTagger:]([CRLPdfTaggerListParagraphLevelResolver alloc], "initWithTagger:", self);
  -[NSMutableArray crl_push:](self->_paragraphLevelResolverStack, "crl_push:", v9);

}

- (void)executeBlock:(id)a3
{
  void (**v4)(void);

  v4 = (void (**)(void))a3;
  if (self->_stateIsValid)
    v4[2]();

}

- (void)pushContext:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  v4 = -[NSMutableArray count](self->_contextStack, "count");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v13)));
  v6 = objc_msgSend(v5, "UTF8String");
  sub_10042FA6C((uint64_t)v4, (uint64_t)"PUSH %s", v7, v8, v9, v10, v11, v12, (uint64_t)v6);

  -[NSMutableArray crl_push:](self->_contextStack, "crl_push:", v13);
}

- (void)popContextWithExpectedClass:(Class)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;

  v23 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray crl_peek](self->_contextStack, "crl_peek"));
  if ((objc_opt_isKindOfClass(v23, a3) & 1) == 0)
  {
    objc_opt_class(v23, v5);
    sub_10042E790(0, (uint64_t)"Class mismatch popping rendering context: %@ instead of %@", v7, v8, v9, v10, v11, v12, v6);
  }
  v13 = -[NSMutableArray crl_pop](self->_contextStack, "crl_pop");
  v14 = -[NSMutableArray count](self->_contextStack, "count");
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v23)));
  v16 = objc_msgSend(v15, "UTF8String");
  sub_10042FA6C((uint64_t)v14, (uint64_t)"POP %s", v17, v18, v19, v20, v21, v22, (uint64_t)v16);

}

- (void)beginTagWithType:(int)a3 tagProperties:(id)a4
{
  uint64_t v4;
  const char *Name;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CRLPdfTagInfo *v14;
  const __CFDictionary *tagProperties;

  v4 = *(_QWORD *)&a3;
  tagProperties = (const __CFDictionary *)a4;
  Name = CGPDFTagTypeGetName((CGPDFTagType)v4);
  v7 = -[NSMutableArray count](self->_tagStack, "count");
  sub_10042FA6C((uint64_t)v7 - 1, (uint64_t)"BEGIN %s", v8, v9, v10, v11, v12, v13, (uint64_t)Name);
  v14 = -[CRLPdfTagInfo initWithTagType:tagProperties:]([CRLPdfTagInfo alloc], "initWithTagType:tagProperties:", v4, tagProperties);
  -[NSMutableArray crl_push:](self->_tagStack, "crl_push:", v14);
  if (!-[CRLPdfTagger taggingPreventionDepth](self, "taggingPreventionDepth"))
    CGPDFContextBeginTag(self->_cgContext, (CGPDFTagType)v4, tagProperties);

}

- (void)beginTagWithType:(int)a3
{
  -[CRLPdfTagger beginTagWithType:tagProperties:](self, "beginTagWithType:tagProperties:", *(_QWORD *)&a3, 0);
}

- (void)endTag
{
  CGPDFTagType v3;
  id v4;
  const char *Name;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;

  v20 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray crl_peek](self->_tagStack, "crl_peek"));
  v3 = objc_msgSend(v20, "tagType");
  if (!-[CRLPdfTagger taggingPreventionDepth](self, "taggingPreventionDepth"))
    CGPDFContextEndTag(self->_cgContext);
  v4 = -[NSMutableArray crl_pop](self->_tagStack, "crl_pop");
  Name = CGPDFTagTypeGetName(v3);
  if (-[NSMutableArray count](self->_tagStack, "count"))
  {
    v12 = -[NSMutableArray count](self->_tagStack, "count");
    sub_10042FA6C((uint64_t)v12 - 1, (uint64_t)"END %s", v13, v14, v15, v16, v17, v18, (uint64_t)Name);
  }
  else
  {
    sub_10042E790(0, (uint64_t)"the tagStack count was 0 and we were trying to endTag", v6, v7, v8, v9, v10, v11, v19);
  }

}

- (unint64_t)tagStackHeight
{
  return (unint64_t)-[NSMutableArray count](self->_tagStack, "count");
}

- (void)popTagStackUntilReachingHeight:(unint64_t)a3
{
  char v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = (unint64_t)-[NSMutableArray count](self->_tagStack, "count") >= a3;
  v6 = -[NSMutableArray count](self->_tagStack, "count");
  sub_10042E790(v5, (uint64_t)"Tag stack %d less than desired value %d", v7, v8, v9, v10, v11, v12, (uint64_t)v6);
  while ((unint64_t)-[NSMutableArray count](self->_tagStack, "count") > a3)
    -[CRLPdfTagger endTag](self, "endTag");
}

- (id)topmostContextOfClass:(Class)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray reverseObjectEnumerator](self->_contextStack, "reverseObjectEnumerator", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_isKindOfClass(v8, a3) & 1) != 0)
        {
          v9 = v8;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (unint64_t)depthOfContext:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;

  v4 = a3;
  v5 = (unint64_t)-[NSMutableArray indexOfObjectIdenticalTo:](self->_contextStack, "indexOfObjectIdenticalTo:", v4);
  v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    v6 = (unint64_t)-[NSMutableArray count](self->_contextStack, "count") + ~v5;

  return v6;
}

- (int)tagTypeAtDepth:(unint64_t)a3
{
  CRLPdfTagger *v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v4 = self;
  v5 = (unint64_t)-[NSMutableArray count](self->_tagStack, "count") > a3;
  -[NSMutableArray count](v4->_tagStack, "count");
  sub_10042E790(v5, (uint64_t)"Tag depth %d exceeds tag stack height %d", v6, v7, v8, v9, v10, v11, a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v4->_tagStack, "objectAtIndexedSubscript:", (char *)-[NSMutableArray count](v4->_tagStack, "count") + ~a3));
  LODWORD(v4) = objc_msgSend(v12, "tagType");

  return (int)v4;
}

- (int)topmostTagType
{
  return -[CRLPdfTagger tagTypeAtDepth:](self, "tagTypeAtDepth:", 0);
}

- (unint64_t)depthOfTopmostTagOfType:(int)a3
{
  void *v4;
  char *v5;
  char *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  unint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray reverseObjectEnumerator](self->_tagStack, "reverseObjectEnumerator", 0));
  v5 = (char *)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = 0;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      v8 = 0;
      v9 = &v5[(_QWORD)v6];
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8), "tagType") == a3)
        {
          v10 = (unint64_t)&v8[(_QWORD)v6];
          goto LABEL_11;
        }
        ++v8;
      }
      while (v5 != v8);
      v5 = (char *)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v6 = v9;
      if (v5)
        continue;
      break;
    }
  }
  v10 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_11:

  return v10;
}

- (id)state
{
  return -[CRLPdfTaggerState initWithTagStackHeight:]([CRLPdfTaggerState alloc], "initWithTagStackHeight:", -[CRLPdfTagger tagStackHeight](self, "tagStackHeight"));
}

- (void)setState:(id)a3
{
  id v4;

  v4 = a3;
  -[CRLPdfTagger popTagStackUntilReachingHeight:](self, "popTagStackUntilReachingHeight:", objc_msgSend(v4, "tagStackHeight"));

}

- (id)topOfContextStack
{
  return -[NSMutableArray crl_peek](self->_contextStack, "crl_peek");
}

- (id)topOfContextStackWithExpectedClass:(Class)a3
{
  void *v4;
  char isKindOfClass;
  NSString *v6;
  void *v7;
  uint64_t v8;
  Class v9;
  NSString *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v18;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray crl_peek](self->_contextStack, "crl_peek"));
  isKindOfClass = objc_opt_isKindOfClass(v4, a3);
  v6 = NSStringFromClass(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_opt_class(v4, v8);
  v10 = NSStringFromClass(v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v10);
  sub_10042E790(isKindOfClass & 1, (uint64_t)"Incorrect top context class: expected %@, actual %@", v11, v12, v13, v14, v15, v16, (uint64_t)v7);

  return v4;
}

- (void)restoreStateFromTopOfContextStackWithExpectedClass:(Class)a3
{
  double v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;

  *(_QWORD *)&v5 = objc_opt_class(CRLPdfTaggerContext, a2).n128_u64[0];
  v7 = -[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", v6, v5);
  sub_10042E790(v7, (uint64_t)"Unexpected class hierarchy", v8, v9, v10, v11, v12, v13, v15);
  v16 = (id)objc_claimAutoreleasedReturnValue(-[CRLPdfTagger topOfContextStackWithExpectedClass:](self, "topOfContextStackWithExpectedClass:", a3));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "taggerState"));
  -[CRLPdfTagger setState:](self, "setState:", v14);

  -[CRLPdfTagger popContextWithExpectedClass:](self, "popContextWithExpectedClass:", a3);
}

- (id)topmostColumnContext
{
  uint64_t v3;

  v3 = objc_opt_class(CRLPdfTaggerTextColumnContext, a2);
  return -[CRLPdfTagger topmostContextOfClass:](self, "topmostContextOfClass:", v3);
}

- (id)topmostParagraphContext
{
  uint64_t v3;

  v3 = objc_opt_class(CRLPdfTaggerParagraphContext, a2);
  return -[CRLPdfTagger topmostContextOfClass:](self, "topmostContextOfClass:", v3);
}

- (id)topmostColumn
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPdfTagger topmostColumnContext](self, "topmostColumnContext"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "column"));

  return v3;
}

- (id)topmostTextStorage
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPdfTagger topmostColumn](self, "topmostColumn"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "storage"));

  return v3;
}

- (_NSRange)topmostColumnRange
{
  void *v2;
  id v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPdfTagger topmostColumnContext](self, "topmostColumnContext"));
  v3 = objc_msgSend(v2, "range");
  v5 = v4;

  v6 = (NSUInteger)v3;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (id)topmostParagraphLevelResolver
{
  return -[NSMutableArray crl_peek](self->_paragraphLevelResolverStack, "crl_peek");
}

- (void)beginPage
{
  if (!self->_stateIsValid)
    -[CRLPdfTagger setUp](self, "setUp");
}

- (void)endPage
{
  -[CRLPdfTagger executeBlock:](self, "executeBlock:", &stru_10125D9C0);
}

- (void)beginTextStorageChunk:(id)a3 limitSelection:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  CRLPdfTagger *v8;
  id v9;
  id v10;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1004306B0;
  v7[3] = &unk_10125D9E8;
  v8 = self;
  v9 = a3;
  v10 = a4;
  v5 = v10;
  v6 = v9;
  -[CRLPdfTagger executeBlock:](v8, "executeBlock:", v7);

}

- (void)endTextStorageChunk:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1004309C0;
  v3[3] = &unk_101231C50;
  v3[4] = self;
  -[CRLPdfTagger executeBlock:](self, "executeBlock:", v3);
}

- (void)beginTextColumn:(id)a3 limitSelection:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  CRLPdfTagger *v8;
  id v9;
  id v10;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100430AB8;
  v7[3] = &unk_10125D9E8;
  v8 = self;
  v9 = a3;
  v10 = a4;
  v5 = v10;
  v6 = v9;
  -[CRLPdfTagger executeBlock:](v8, "executeBlock:", v7);

}

- (void)endTextColumn:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100430B70;
  v3[3] = &unk_101231C50;
  v3[4] = self;
  -[CRLPdfTagger executeBlock:](self, "executeBlock:", v3);
}

- (BOOL)topOfContextStackIsParagraph
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char isKindOfClass;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray crl_peek](self->_contextStack, "crl_peek"));
  objc_opt_class(CRLPdfTaggerParagraphContext, v3);
  isKindOfClass = objc_opt_isKindOfClass(v2, v4);

  return isKindOfClass & 1;
}

- (void)assertTopOfContextStackIsParagraph:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (-[CRLPdfTagger topOfContextStackIsParagraph](self, "topOfContextStackIsParagraph") != a3)
    sub_10042E790(0, (uint64_t)"Incorrect paragraph rendering context life span", v3, v4, v5, v6, v7, v8, v9);
}

+ (unint64_t)indexOfFirstVisibleCharInRange:(_NSRange)a3 ofStorage:(id)a4
{
  return a3.location;
}

- (void)beginMultiParagraphEntityWithLineFragmentRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  char v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  int v29;
  id v30;
  double v31;
  signed int v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  id v37;

  length = a3.length;
  location = a3.location;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPdfTagger topmostParagraphLevelResolver](self, "topmostParagraphLevelResolver"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPdfTagger topmostColumnContext](self, "topmostColumnContext"));
  v8 = objc_msgSend(v7, "paragraphEnumerator");
  v16 = sub_100172228((uint64_t)v8);
  v18 = (unint64_t)v16 <= location && (unint64_t)v16 + v9 >= location + length;
  sub_10042E790(v18, (uint64_t)"Line fragment not within current paragraph", v10, v11, v12, v13, v14, v15, v33);
  v37 = 0;
  v19 = objc_msgSend(v6, "levelOfCurrentParagraph:", &v37);
  v35 = v37;
  if ((v19 & 0x80000000) != 0)
    goto LABEL_17;
  v34 = v7;
  v20 = -[CRLPdfTagger topmostColumnRange](self, "topmostColumnRange");
  v22 = v21;
  *(_QWORD *)&v23 = objc_opt_class(self, v21).n128_u64[0];
  v25 = v24;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "column", v23));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "storage"));
  v28 = objc_msgSend(v25, "indexOfFirstVisibleCharInRange:ofStorage:", v20, v22, v27);

  if (v28 >= v16)
  {
    v30 = 0;
    v29 = -1;
  }
  else
  {
    v36 = 0;
    v29 = objc_msgSend(v6, "levelOfCurrentParagraph:", &v36, sub_100172100((uint64_t)v8));
    v30 = v36;
    v31 = sub_100172124((uint64_t)v8);
    if ((int)v19 <= v29)
    {
      if ((_DWORD)v19 != v29)
      {

        v7 = v34;
        goto LABEL_17;
      }
      v32 = objc_msgSend(v6, "paragraphInfo:matchesParagraphInfo:level:", v30, v35, v19, v31) ^ 1;
      v7 = v34;
      goto LABEL_15;
    }
  }
  v7 = v34;
  v32 = (_DWORD)v19 - v29;
LABEL_15:

  if (v32 >= 1)
  {
    do
    {
      -[CRLPdfTagger beginTagWithType:](self, "beginTagWithType:", objc_msgSend(v6, "tagType"));
      --v32;
    }
    while (v32);
  }
LABEL_17:

}

- (void)endMultiParagraphEntityWithLineFragmentRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  void *v7;
  id v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char v19;
  id v20;
  char *v21;
  uint64_t v22;
  char *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  int v31;
  signed int v32;
  double v33;
  uint64_t v34;
  id v35;
  id v36;
  id v37;

  length = a3.length;
  location = a3.location;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPdfTagger topmostParagraphLevelResolver](self, "topmostParagraphLevelResolver"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPdfTagger topmostColumnContext](self, "topmostColumnContext"));
  v8 = objc_msgSend(v7, "paragraphEnumerator");
  v9 = (char *)sub_100172228((uint64_t)v8);
  v17 = &v9[v16];
  v19 = (unint64_t)v9 <= location && (unint64_t)v17 >= location + length;
  sub_10042E790(v19, (uint64_t)"Line fragment not within current paragraph", v10, v11, v12, v13, v14, v15, v34);
  v37 = 0;
  v20 = objc_msgSend(v6, "levelOfCurrentParagraph:", &v37);
  v35 = v37;
  if ((v20 & 0x80000000) != 0)
    goto LABEL_14;
  v21 = (char *)-[CRLPdfTagger topmostColumnRange](self, "topmostColumnRange");
  v23 = (char *)(&v21[v22] - v17);
  if (&v21[v22] <= v17
    || (*(_QWORD *)&v24 = objc_opt_class(self, v22).n128_u64[0],
        v26 = v25,
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "column", v24)),
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "storage")),
        v29 = objc_msgSend(v26, "indexOfFirstVisibleCharInRange:ofStorage:", v17, v23, v28),
        v28,
        v27,
        v29 == (id)0x7FFFFFFFFFFFFFFFLL))
  {
    v30 = 0;
    v31 = -1;
  }
  else
  {
    v36 = 0;
    v31 = objc_msgSend(v6, "levelOfCurrentParagraph:", &v36, sub_100172124((uint64_t)v8));
    v30 = v36;
    v33 = sub_100172100((uint64_t)v8);
    if ((int)v20 <= v31)
    {
      if ((_DWORD)v20 != v31)
      {

        goto LABEL_14;
      }
      v32 = objc_msgSend(v6, "paragraphInfo:matchesParagraphInfo:level:", v35, v30, v20, v33) ^ 1;
      goto LABEL_12;
    }
  }
  v32 = (_DWORD)v20 - v31;
LABEL_12:

  if (v32 >= 1)
  {
    do
    {
      -[CRLPdfTagger endTag](self, "endTag");
      --v32;
    }
    while (v32);
  }
LABEL_14:

}

+ (BOOL)isHeadingStyle:(id)a3 headingIndex:(int *)a4
{
  unsigned int v5;

  v5 = objc_msgSend(a3, "intValueForProperty:", 41);
  if (a4 && v5 <= 6)
    *a4 = v5;
  return v5 < 7;
}

+ (BOOL)isHeaderTag:(int)a3
{
  return (a3 - 201) < 7;
}

- (BOOL)currentParagraphNeedsSpans
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  char v7;
  _QWORD v9[6];
  _QWORD v10[3];
  char v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPdfTagger topmostColumnContext](self, "topmostColumnContext"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "column"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "storage"));
  v5 = sub_100172228((uint64_t)objc_msgSend(v2, "paragraphEnumerator"));
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v11 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100431244;
  v9[3] = &unk_10125DA10;
  v9[4] = &v12;
  v9[5] = v10;
  objc_msgSend(v4, "enumerateSmartFieldsWithAttributeKind:inRange:usingBlock:", 6, v5, v6, v9);
  v7 = *((_BYTE *)v13 + 24);
  _Block_object_dispose(v10, 8);
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (BOOL)currentParagraphHasContents
{
  void *v3;
  void *v4;
  void *v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  double v10;
  id v11;
  char *v12;
  BOOL v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPdfTagger topmostColumnContext](self, "topmostColumnContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "column"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "storage"));
  v6 = (char *)sub_100172228((uint64_t)objc_msgSend(v3, "paragraphEnumerator"));
  v8 = v6;
  v9 = v7;
  if (v7)
    v9 = v7 - sub_1001AE2A0((uint64_t)objc_msgSend(v5, "characterAtIndex:", &v6[v7 - 1]));
  *(_QWORD *)&v10 = objc_opt_class(self, v7).n128_u64[0];
  v12 = (char *)objc_msgSend(v11, "indexOfFirstVisibleCharInRange:ofStorage:", v8, v9, v5, v10);
  v14 = v12 != (char *)0x7FFFFFFFFFFFFFFFLL && v12 < &v8[v9];

  return v14;
}

- (void)beginParagraphWithLineFragmentRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  CRLPdfTaggerParagraphContext *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  unsigned int v14;
  unsigned int v15;
  BOOL v16;
  uint64_t v17;
  int v18;
  int v19;

  length = a3.length;
  location = a3.location;
  -[CRLPdfTagger assertTopOfContextStackIsParagraph:](self, "assertTopOfContextStackIsParagraph:", 0);
  -[CRLPdfTagger beginMultiParagraphEntityWithLineFragmentRange:](self, "beginMultiParagraphEntityWithLineFragmentRange:", location, length);
  v6 = -[CRLPdfTaggerParagraphContext initWithStateOfTagger:needsSpans:]([CRLPdfTaggerParagraphContext alloc], "initWithStateOfTagger:needsSpans:", self, -[CRLPdfTagger currentParagraphNeedsSpans](self, "currentParagraphNeedsSpans"));
  -[CRLPdfTagger pushContext:](self, "pushContext:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPdfTagger topmostColumnContext](self, "topmostColumnContext"));
  v8 = objc_msgSend(v7, "paragraphEnumerator");
  v9 = sub_1001721A4((uint64_t)v8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = sub_1001722DC((uint64_t)v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = objc_msgSend(v12, "labelTypeForLevel:", sub_1001722CC((uint64_t)v8));
  v19 = 0;
  v14 = +[CRLPdfTagger isHeadingStyle:headingIndex:](CRLPdfTagger, "isHeadingStyle:headingIndex:", v10, &v19);
  if (v14)
    v15 = dword_100EF0210[v19];
  else
    v15 = 0;
  if (v13)
    v16 = v15 == 0;
  else
    v16 = 0;
  if (v16)
    v15 = 301;
  if (v15)
    v17 = v15;
  else
    v17 = 200;
  if (v15)
    v18 = v14;
  else
    v18 = 1;
  if (v18 != 1 || -[CRLPdfTagger currentParagraphHasContents](self, "currentParagraphHasContents"))
    -[CRLPdfTagger beginTagWithType:](self, "beginTagWithType:", v17);

}

- (void)endParagraphWithLineFragmentRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  double v6;
  uint64_t v7;

  length = a3.length;
  location = a3.location;
  *(_QWORD *)&v6 = objc_opt_class(CRLPdfTaggerParagraphContext, a2).n128_u64[0];
  -[CRLPdfTagger restoreStateFromTopOfContextStackWithExpectedClass:](self, "restoreStateFromTopOfContextStackWithExpectedClass:", v7, v6);
  -[CRLPdfTagger endMultiParagraphEntityWithLineFragmentRange:](self, "endMultiParagraphEntityWithLineFragmentRange:", location, length);
}

- (void)beginParagraphBodyWithLineFragmentRange:(_NSRange)a3
{
  if (-[CRLPdfTagger topmostTagType](self, "topmostTagType", a3.location, a3.length) == 301)
    -[CRLPdfTagger beginTagWithType:](self, "beginTagWithType:", 303);
}

- (void)assertCharIndexRelativeToParagraphRange:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (!a3)
    sub_10042E790(0, (uint64_t)"Char index not in paragraph range", a3, v3, v4, v5, v6, v7, v8);
}

- (void)advanceParagraphEnumeratorToCharIndex:(unint64_t)a3
{
  id i;
  id v5;
  uint64_t v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[CRLPdfTagger topmostColumnContext](self, "topmostColumnContext"));
  for (i = objc_msgSend(v7, "paragraphEnumerator"); ; sub_100172124((uint64_t)i))
  {
    v5 = sub_100172228((uint64_t)i);
    if ((unint64_t)v5 + v6 > a3)
      break;
  }

}

- (_NSRange)currentParagraphRange
{
  id v3;
  NSUInteger v4;
  NSUInteger v5;
  void *v6;
  NSRange v7;
  NSUInteger location;
  NSUInteger length;
  NSRange v10;
  _NSRange result;
  NSRange v12;

  v3 = -[CRLPdfTagger topmostColumnRange](self, "topmostColumnRange");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPdfTagger topmostColumnContext](self, "topmostColumnContext"));
  v10.location = (NSUInteger)sub_100172228((uint64_t)objc_msgSend(v6, "paragraphEnumerator"));
  v12.location = (NSUInteger)v3;
  v12.length = v5;
  v7 = NSIntersectionRange(v10, v12);

  location = v7.location;
  length = v7.length;
  result.length = length;
  result.location = location;
  return result;
}

- (BOOL)charIndexIsAtStartOfParagraph:(unint64_t)a3
{
  return -[CRLPdfTagger currentParagraphRange](self, "currentParagraphRange") == (id)a3;
}

- (BOOL)charIndexIsAtEndOfParagraph:(unint64_t)a3
{
  char *v4;
  uint64_t v5;

  v4 = (char *)-[CRLPdfTagger currentParagraphRange](self, "currentParagraphRange");
  return &v4[v5] == (char *)a3;
}

- (unint64_t)indexOfFirstVisibleCharInParagraphAtOrAfterCharIndex:(unint64_t)a3
{
  id v4;
  unint64_t v5;

  v4 = -[CRLPdfTagger currentParagraphRange](self, "currentParagraphRange");
  if (a3 - (unint64_t)v4 < v5 && a3 >= (unint64_t)v4)
    return a3;
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)beginLineFragmentWithRange:(_NSRange)a3
{
  _QWORD v3[5];
  _NSRange v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1004317D4;
  v3[3] = &unk_10125DA38;
  v4 = a3;
  v3[4] = self;
  -[CRLPdfTagger executeBlock:](self, "executeBlock:", v3);
}

- (void)endLineFragmentWithRange:(_NSRange)a3
{
  _QWORD v3[5];
  _NSRange v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100431888;
  v3[3] = &unk_10125DA38;
  v4 = a3;
  v3[4] = self;
  -[CRLPdfTagger executeBlock:](self, "executeBlock:", v3);
}

- (void)beginListLabel
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100431934;
  v2[3] = &unk_101231C50;
  v2[4] = self;
  -[CRLPdfTagger executeBlock:](self, "executeBlock:", v2);
}

- (void)endListLabel
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100431A14;
  v2[3] = &unk_101231C50;
  v2[4] = self;
  -[CRLPdfTagger executeBlock:](self, "executeBlock:", v2);
}

- (void)beginLineFragmentBodyWithRange:(_NSRange)a3
{
  _QWORD v3[5];
  _NSRange v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100431A9C;
  v3[3] = &unk_10125DA38;
  v4 = a3;
  v3[4] = self;
  -[CRLPdfTagger executeBlock:](self, "executeBlock:", v3);
}

- (void)endLineFragmentBodyWithRange:(_NSRange)a3
{
  _QWORD v3[5];
  _NSRange v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100431B8C;
  v3[3] = &unk_10125DA38;
  v4 = a3;
  v3[4] = self;
  -[CRLPdfTagger executeBlock:](self, "executeBlock:", v3);
}

- (BOOL)needsSeparateRunsForLineFragmentWithRange:(_NSRange)a3
{
  return 1;
}

- (id)retrieveHighestInfoAtCharIndex:(unint64_t)a3 returnTagType:(int *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPdfTagger topmostTextStorage](self, "topmostTextStorage"));
  v7 = v6;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "smartFieldAtCharIndex:attributeKind:effectiveRange:", a3, 6, 0));
    objc_opt_class(CRLWPHyperlinkField, v10);
    v12 = sub_100221D0C(v11, v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v12);

    if (v8)
      *a4 = 506;
  }

  return v8;
}

- (void)beginPrimaryTextRunWithRange:(_NSRange)a3 hasActualContents:(BOOL)a4
{
  _QWORD v4[5];
  _NSRange v5;
  BOOL v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100431D0C;
  v4[3] = &unk_10125DA60;
  v4[4] = self;
  v5 = a3;
  v6 = a4;
  -[CRLPdfTagger executeBlock:](self, "executeBlock:", v4);
}

- (void)endPrimaryTextRunWithRange:(_NSRange)a3 hasActualContents:(BOOL)a4
{
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100431E40;
  v4[3] = &unk_101231C50;
  v4[4] = self;
  -[CRLPdfTagger executeBlock:](self, "executeBlock:", v4, a3.length, a4);
}

- (void)beginAncillaryTextRunWithRange:(_NSRange)a3 baseTextRange:(_NSRange)a4
{
  _QWORD v4[5];
  _NSRange v5;
  _NSRange v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100431ECC;
  v4[3] = &unk_10125DA88;
  v4[4] = self;
  v5 = a3;
  v6 = a4;
  -[CRLPdfTagger executeBlock:](self, "executeBlock:", v4);
}

- (void)endAncillaryTextRunWithRange:(_NSRange)a3 baseTextRange:(_NSRange)a4
{
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100431FC4;
  v4[3] = &unk_101231C50;
  v4[4] = self;
  -[CRLPdfTagger executeBlock:](self, "executeBlock:", v4, a3.length, a4.location, a4.length);
}

- (void)dispatchObject:(id)a3 drawableBlock:(id)a4
{
  void (**v5)(id, id);
  uint64_t v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v13 = a3;
  v5 = (void (**)(id, id))a4;
  *(_QWORD *)&v7 = objc_opt_class(_TtC8Freeform16CRLBoardItemBase, v6).n128_u64[0];
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "info", v7));
  v11 = sub_100221D0C(v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  if (v5 && v12)
    v5[2](v5, v13);

}

- (void)handleObject:(id)a3 drawableBlock:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  CRLPdfTagger *v8;
  id v9;
  id v10;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100432198;
  v7[3] = &unk_10125DAB0;
  v8 = self;
  v9 = a3;
  v10 = a4;
  v5 = v10;
  v6 = v9;
  -[CRLPdfTagger executeBlock:](v8, "executeBlock:", v7);

}

- (id)regularDrawableRepForObjectRep:(id)a3
{
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_100432274;
  v10 = sub_100432284;
  v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10043228C;
  v5[3] = &unk_10125DAD8;
  v5[4] = &v6;
  -[CRLPdfTagger dispatchObject:drawableBlock:](self, "dispatchObject:drawableBlock:", a3, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

+ (BOOL)shouldMapDrawableRep:(id)a3
{
  id v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  char v17;
  uint64_t v18;
  char isKindOfClass;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;

  v3 = a3;
  *(_QWORD *)&v5 = objc_opt_class(_TtC8Freeform16CRLBoardItemBase, v4).n128_u64[0];
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "info", v5));
  v9 = sub_100221D0C(v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  objc_opt_class(_TtC8Freeform12CRLGroupItem, v11);
  v13 = sub_100221D0C(v12, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v13);
  if (v15)
    v16 = 1;
  else
    v16 = v10 == 0;
  v17 = !v16;
  objc_opt_class(CRLFreehandDrawingRep, v14);
  isKindOfClass = objc_opt_isKindOfClass(v3, v18);
  objc_opt_class(CRLWPShapeRep, v20);
  v23 = isKindOfClass | v17;
  if ((objc_opt_isKindOfClass(v3, v21) & 1) != 0)
  {
    *(_QWORD *)&v24 = objc_opt_class(_TtC8Freeform16CRLBoardItemBase, v22).n128_u64[0];
    v26 = v25;
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "info", v24));
    v28 = sub_100221D0C(v26, v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);

    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "accessibilityDescription"));
    v23 |= objc_msgSend(v30, "length") != 0;

  }
  return v23 & 1;
}

- (void)beginObject:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100432490;
  v3[3] = &unk_10125DB00;
  v3[4] = self;
  -[CRLPdfTagger handleObject:drawableBlock:](self, "handleObject:drawableBlock:", a3, v3);
}

- (void)endObject:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100432548;
  v3[3] = &unk_10125DB00;
  v3[4] = self;
  -[CRLPdfTagger handleObject:drawableBlock:](self, "handleObject:drawableBlock:", a3, v3);
}

- (void)beginDrawable:(id)a3
{
  id v4;
  CRLPdfTaggerDrawableContext *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  uint64_t v32;
  void *v33;
  int v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint8_t buf[24];
  CGPDFTagProperty v41;
  void *v42;

  v4 = a3;
  v5 = -[CRLPdfTaggerDrawableContext initWithStateOfTagger:drawableRep:]([CRLPdfTaggerDrawableContext alloc], "initWithStateOfTagger:drawableRep:", self, v4);
  -[CRLPdfTagger pushContext:](self, "pushContext:", v5);
  *(_QWORD *)&v7 = objc_opt_class(_TtC8Freeform16CRLBoardItemBase, v6).n128_u64[0];
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "info", v7));
  v11 = sub_100221D0C(v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "accessibilityDescription"));
  if (objc_msgSend(v13, "length"))
  {
    v41 = kCGPDFTagPropertyAlternativeText;
    v42 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1));
  }
  else
  {
    v14 = 0;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPdfTagger state](self, "state"));
  -[CRLPdfTaggerDrawableContext setTaggerStateOutsideCore:](v5, "setTaggerStateOutsideCore:", v15);

  objc_opt_class(_TtC8Freeform14CRLWPShapeItem, v16);
  if ((objc_opt_isKindOfClass(v12, v17) & 1) != 0
    || (objc_opt_class(_TtC8Freeform21CRLConnectionLineItem, v18),
        (objc_opt_isKindOfClass(v12, v19) & 1) != 0)
    || (objc_opt_class(_TtC8Freeform12CRLImageItem, v20), (objc_opt_isKindOfClass(v12, v21) & 1) != 0)
    || (objc_opt_class(_TtC8Freeform12CRLMovieItem, v22), (objc_opt_isKindOfClass(v12, v23) & 1) != 0)
    || (objc_opt_class(_TtC8Freeform22CRLFreehandDrawingItem, v24),
        (objc_opt_isKindOfClass(v12, v25) & 1) != 0)
    || (objc_opt_class(_TtC8Freeform10CRLURLItem, v26), (objc_opt_isKindOfClass(v12, v27) & 1) != 0)
    || (objc_opt_class(_TtC8Freeform11CRLFileItem, v28), (objc_opt_isKindOfClass(v12, v29) & 1) != 0))
  {
    -[CRLPdfTagger beginTagWithType:tagProperties:](self, "beginTagWithType:tagProperties:", 700, v14);
  }
  else
  {
    *(_QWORD *)&v31 = objc_opt_class(v12, v30).n128_u64[0];
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v31, v32));
    if ((objc_msgSend(&off_1012CB920, "containsObject:", v33) & 1) == 0)
    {
      v34 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125DB20);
      v35 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E33F44((uint64_t)v33, v34, v35);
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125DB40);
      v36 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_ERROR))
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100E02830(v37, buf, v34, (os_log_t)v36);
      }

      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPdfTagger beginDrawable:]"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLPdfTagger.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v38, v39, 1488, 0, "Drawable of class %@ not handled", v33);

    }
  }

}

- (void)endDrawable:(id)a3
{
  double v4;
  uint64_t v5;

  *(_QWORD *)&v4 = objc_opt_class(CRLPdfTaggerDrawableContext, a2).n128_u64[0];
  -[CRLPdfTagger restoreStateFromTopOfContextStackWithExpectedClass:](self, "restoreStateFromTopOfContextStackWithExpectedClass:", v5, v4);
}

- (void)beginFreehandDrawing:(id)a3
{
  id v3;
  _QWORD v4[4];
  CRLPdfTagger *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100432B2C;
  v4[3] = &unk_10124E0C0;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[CRLPdfTagger executeBlock:](v5, "executeBlock:", v4);

}

- (void)endFreehandDrawing:(id)a3
{
  id v3;
  _QWORD v4[4];
  CRLPdfTagger *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100432BC8;
  v4[3] = &unk_10124E0C0;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[CRLPdfTagger executeBlock:](v5, "executeBlock:", v4);

}

- (void)beginComment
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100432C28;
  v2[3] = &unk_101231C50;
  v2[4] = self;
  -[CRLPdfTagger executeBlock:](self, "executeBlock:", v2);
}

- (void)endComment
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100432CE8;
  v2[3] = &unk_101231C50;
  v2[4] = self;
  -[CRLPdfTagger executeBlock:](self, "executeBlock:", v2);
}

- (CGContext)cgContext
{
  return self->_cgContext;
}

- (void)setCgContext:(CGContext *)a3
{
  self->_cgContext = a3;
}

- (unint64_t)taggingPreventionDepth
{
  return self->_taggingPreventionDepth;
}

- (void)setTaggingPreventionDepth:(unint64_t)a3
{
  self->_taggingPreventionDepth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paragraphLevelResolverStack, 0);
  objc_storeStrong((id *)&self->_tagStack, 0);
  objc_storeStrong((id *)&self->_contextStack, 0);
}

@end
