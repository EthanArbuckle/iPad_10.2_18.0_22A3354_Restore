@implementation THCFIInnerPathReader

- (THCFIInnerPathReader)initWithInnerCfiFrag:(id)a3
{
  char *v4;
  THCFIInnerPathReader *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THCFIInnerPathReader;
  v4 = -[THCFIInnerPathReader init](&v7, "init");
  v5 = (THCFIInnerPathReader *)v4;
  if (v4)
  {
    *((_DWORD *)v4 + 4) = 0;
    *(CGPoint *)(v4 + 24) = CGPointZero;
    *(_OWORD *)(v4 + 40) = 0u;
    *(_OWORD *)(v4 + 56) = 0u;
    *((_QWORD *)v4 + 9) = 0;
    *((_QWORD *)v4 + 1) = objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("/"));
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THCFIInnerPathReader;
  -[THCFIInnerPathReader dealloc](&v3, "dealloc");
}

- (unint64_t)characterOffsetTerminatingStepIdentifier:(id *)a3
{
  if (a3)
    *a3 = self->mTerminatingCharOffsetIdentifier;
  return self->mTerminatingCharacterOffset;
}

- (id)terminatingComponentIdentifier
{
  return self->mTerminatingComponentIdentifier;
}

- (unint64_t)temporalOffsetTerminatingStepInSeconds
{
  return self->mTerminatingTemporalOffset;
}

- (CGPoint)spatialOffsetTerminatingStep
{
  double x;
  double y;
  CGPoint result;

  x = self->mTerminatingSpacialOffset.x;
  y = self->mTerminatingSpacialOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (int)sideBiasOfTerminatingStep
{
  return self->mTerminatingSideBias;
}

- (id)pathStringNoIds
{
  id v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  const __CFString *v9;

  v3 = +[NSMutableString string](NSMutableString, "string");
  v4 = -[THCFIInnerPathReader componentCount](self, "componentCount");
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = v4 - 1;
    do
    {
      v8 = -[THCFIInnerPathReader componentAtIndex:identifier:](self, "componentAtIndex:identifier:", v6, 0);
      if (v8)
      {
        if (v6 >= v7)
          v9 = CFSTR("%lu");
        else
          v9 = CFSTR("%lu/");
        objc_msgSend(v3, "appendFormat:", v9, v8);
      }
      ++v6;
    }
    while (v5 != v6);
  }
  return v3;
}

- (void)parseTerminatingStep
{
  NSArray *mInsidePathComponents;
  id v4;
  char *v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  id v19;
  void *v20;
  CGFloat v21;
  CGFloat v22;

  mInsidePathComponents = self->mInsidePathComponents;
  self->mInsidePathComponents = (NSArray *)+[THCFIReader mergeBackArrayComponentsWithEscapeIn:desiredMaxCount:separator:](THCFIReader, "mergeBackArrayComponentsWithEscapeIn:desiredMaxCount:separator:", mInsidePathComponents, 0, CFSTR("/"));

  v4 = -[NSArray lastObject](self->mInsidePathComponents, "lastObject");
  v5 = (char *)objc_msgSend(v4, "length");
  if (v5)
  {
    v6 = (unint64_t)v5;
    v7 = 0;
    v8 = 0;
    v9 = v5 - 1;
    v10 = -1;
    v11 = -1;
    do
    {
      v12 = v7;
      v13 = objc_msgSend(v4, "characterAtIndex:", v8);
      if (v13 <= 90)
      {
        if (v13 != 58)
        {
          if (v13 != 59)
          {
            if (v13 == 64)
            {
              if (v10 != -1)
                v11 = v8;
              v14 = 1;
              v7 = 4;
              goto LABEL_63;
            }
            goto LABEL_29;
          }
          if (v10 != -1)
            v11 = v8;
          if (v7 == 6 || v7 == 1)
          {
            if (v6 < v8 + 3
              || objc_msgSend(v4, "characterAtIndex:", v8 + 1) != 115
              || objc_msgSend(v4, "characterAtIndex:", v8 + 2) != 61)
            {
              goto LABEL_61;
            }
            v18 = objc_msgSend(v4, "characterAtIndex:", v8 + 3);
            if (v18 == 98)
            {
              v14 = 0;
              self->mTerminatingSideBias = -1;
LABEL_83:
              v8 += 3;
            }
            else
            {
              if (v18 == 97)
              {
                v14 = 0;
                self->mTerminatingSideBias = 1;
                goto LABEL_83;
              }
LABEL_61:
              v14 = 1;
            }
            v12 = 6;
            goto LABEL_63;
          }
LABEL_57:
          v14 = 1;
          goto LABEL_63;
        }
        v15 = 5;
        if (v7 != 4)
          v15 = v7;
        if (v7)
          v7 = v15;
        else
          v7 = 3;
        if (v10 != -1)
          v11 = v8;
      }
      else
      {
        if (v13 > 93)
        {
          if (v13 == 126)
          {
            if (v10 != -1)
              v11 = v8;
            v14 = 1;
            v7 = 2;
            goto LABEL_63;
          }
          if (v13 == 94)
          {
            ++v8;
          }
          else
          {
LABEL_29:
            if (v10 == -1)
              v10 = v8;
          }
          goto LABEL_57;
        }
        if (v13 == 91)
        {
          if (v10 != -1)
            v11 = v8;
          if (v7)
            v16 = v7;
          else
            v16 = 1;
          if (v7)
            v17 = v7;
          else
            v17 = 0;
          if (v7 == 3)
            v7 = 6;
          else
            v7 = v16;
          if (v12 != 3)
            v12 = v17;
          v14 = 1;
          goto LABEL_63;
        }
        if (v13 != 93)
          goto LABEL_29;
        if (v10 != -1)
          v11 = v8;
        if (v7 == 1)
          v7 = 0;
      }
      v14 = 1;
LABEL_63:
      if (((v8 == (_QWORD)v9) & v14) != 0)
        v11 = v8 + 1;
      if (v10 != -1 && v11 != -1)
      {
        v19 = objc_msgSend(v4, "substringWithRange:", v10, v11 - v10);
        v20 = v19;
        switch(v12)
        {
          case 0:
            self->mTerminatingComponent = (unint64_t)objc_msgSend(v19, "integerValue");
            break;
          case 1:
            if (self->mTerminatingCharOffsetIdentifier)
            {
              objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THCFIInnerPathReader parseTerminatingStep]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/Common/THCFIInnerPathReader.mm"), 245, CFSTR("%@"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("unexpected text found in terminating step parseLookingForComponentIdentifier: %@, curNum: %@"), v4, v19));
            }
            else
            {

              self->mTerminatingComponentIdentifier = (NSString *)v20;
            }
            break;
          case 2:
            self->mTerminatingTemporalOffset = (unint64_t)objc_msgSend(v19, "integerValue");
            break;
          case 3:
            self->mTerminatingCharacterOffset = (unint64_t)objc_msgSend(v19, "integerValue");
            break;
          case 4:
            objc_msgSend(v19, "doubleValue");
            self->mTerminatingSpacialOffset.x = v21;
            break;
          case 5:
            objc_msgSend(v19, "doubleValue");
            self->mTerminatingSpacialOffset.y = v22;
            break;
          case 6:
            if (self->mTerminatingCharOffsetIdentifier)
              objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THCFIInnerPathReader parseTerminatingStep]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/Common/THCFIInnerPathReader.mm"), 230, CFSTR("%@"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("unexpected text found in terminating step parseLookingForSideBias: %@, curNum: %@"), v4, v19));
            else
              self->mTerminatingCharOffsetIdentifier = (NSString *)v19;
            break;
          default:
            break;
        }
        v11 = -1;
        v10 = -1;
      }
      ++v8;
    }
    while (v8 < v6);
  }
}

- (BOOL)updateWithCfiFrag:(id)a3 toIndex:(unint64_t)a4
{
  id v6;
  char *v7;
  NSUInteger v8;
  char *v9;
  id v10;

  v6 = +[THCFIReader mergeBackArrayComponentsWithEscapeIn:desiredMaxCount:separator:](THCFIReader, "mergeBackArrayComponentsWithEscapeIn:desiredMaxCount:separator:", objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("/")), 0, CFSTR("/"));
  v7 = (char *)objc_msgSend(v6, "count");
  v8 = -[NSArray count](self->mInsidePathComponents, "count");
  v9 = v7 - 1;
  v10 = objc_msgSend(objc_msgSend(v6, "objectAtIndex:", v9), "componentsSeparatedByString:", CFSTR(":"));
  if ((unint64_t)objc_msgSend(v10, "count") < 2)
    return 0;
  objc_msgSend(v6, "replaceObjectAtIndex:withObject:", v9, objc_msgSend(v10, "objectAtIndex:", 0));
  if (objc_msgSend(objc_msgSend(v10, "objectAtIndex:", 1), "integerValue"))
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THCFIInnerPathReader updateWithCfiFrag:toIndex:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/Common/THCFIInnerPathReader.mm"), 276, CFSTR("if we don't have a CFI with no offset, we can't resolve the rest. returning NO."));
    return 0;
  }
  while (v8 != a4)
    objc_msgSend(v6, "addObject:", -[NSArray objectAtIndex:](self->mInsidePathComponents, "objectAtIndex:", a4++));

  self->mInsidePathComponents = (NSArray *)v6;
  -[THCFIInnerPathReader parseTerminatingStep](self, "parseTerminatingStep");
  return 1;
}

- (unint64_t)componentAtIndex:(unint64_t)a3 identifier:(id *)a4
{
  if ((char *)-[NSArray count](self->mInsidePathComponents, "count") - 1 != (_BYTE *)a3)
    return +[THCFIReader componentOfArray:atIndex:identifier:](THCFIReader, "componentOfArray:atIndex:identifier:", self->mInsidePathComponents, a3, a4);
  if (a4)
    *a4 = self->mTerminatingComponentIdentifier;
  return self->mTerminatingComponent;
}

- (unint64_t)componentCount
{
  return -[NSArray count](self->mInsidePathComponents, "count");
}

@end
