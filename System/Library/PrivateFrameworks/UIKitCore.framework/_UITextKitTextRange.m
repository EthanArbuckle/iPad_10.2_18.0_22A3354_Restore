@implementation _UITextKitTextRange

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unionTextRange, 0);
  objc_storeStrong((id *)&self->_textKit2Ranges, 0);
  objc_storeStrong((id *)&self->_end, 0);
  objc_storeStrong((id *)&self->_start, 0);
}

- (_UITextKitTextPosition)start
{
  return self->_start;
}

- (_UITextKitTextPosition)end
{
  return self->_end;
}

+ (id)rangeWithTextContentManager:(id)a3 textRanges:(id)a4 startAffinity:(int64_t)a5 endAffinity:(int64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD *v18;
  void *v19;

  v10 = a4;
  v11 = a3;
  objc_msgSend(v10, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "location");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UITextKitTextPosition positionWithTextContentManager:location:affinity:](_UITextKitTextPosition, "positionWithTextContentManager:location:affinity:", v11, v14, a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "endLocation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UITextKitTextPosition positionWithTextContentManager:location:affinity:](_UITextKitTextPosition, "positionWithTextContentManager:location:affinity:", v11, v16, a6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "rangeWithStart:end:", v15, v17);
  v18 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18[4];
  v18[4] = v10;

  return v18;
}

+ (id)rangeWithStart:(id)a3 end:(id)a4
{
  id v5;
  id v6;
  _UITextKitTextRange *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(_UITextKitTextRange);
  v8 = objc_msgSend(v5, "offset");
  v9 = objc_msgSend(v6, "offset");
  if (v8 >= v9)
    v10 = v6;
  else
    v10 = v5;
  if (v8 >= v9)
    v11 = v5;
  else
    v11 = v6;
  -[_UITextKitTextRange setStart:](v7, "setStart:", v10);
  -[_UITextKitTextRange setEnd:](v7, "setEnd:", v11);

  return v7;
}

- (void)setStart:(id)a3
{
  objc_storeStrong((id *)&self->_start, a3);
}

- (void)setEnd:(id)a3
{
  objc_storeStrong((id *)&self->_end, a3);
}

- (_UITextKitTextRange)init
{
  _UITextKitTextRange *v2;
  _UITextKitTextRange *v3;
  _UITextKitTextPosition *start;
  _UITextKitTextPosition *end;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UITextKitTextRange;
  v2 = -[_UITextKitTextRange init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    start = v2->_start;
    v2->_start = 0;

    end = v3->_end;
    v3->_end = 0;

  }
  return v3;
}

- (NSTextRange)unionTextRange
{
  NSTextRange *unionTextRange;
  NSArray *textKit2Ranges;
  _QWORD v6[5];

  unionTextRange = self->_unionTextRange;
  if (!unionTextRange)
  {
    textKit2Ranges = self->_textKit2Ranges;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __37___UITextKitTextRange_unionTextRange__block_invoke;
    v6[3] = &unk_1E16C7AB8;
    v6[4] = self;
    -[NSArray enumerateObjectsUsingBlock:](textKit2Ranges, "enumerateObjectsUsingBlock:", v6);
    unionTextRange = self->_unionTextRange;
  }
  return unionTextRange;
}

- (BOOL)isEmpty
{
  int64_t v3;

  v3 = -[_UITextKitTextPosition offset](self->_start, "offset");
  return v3 == -[_UITextKitTextPosition offset](self->_end, "offset");
}

+ (id)rangeWithTextContentManager:(id)a3 textRanges:(id)a4 affinity:(int64_t)a5
{
  return (id)objc_msgSend(a1, "rangeWithTextContentManager:textRanges:startAffinity:endAffinity:", a3, a4, a5, a5);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = a3;
  -[UITextRange _attachmentRange](self, "_attachmentRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else
  {
    objc_msgSend(v4, "_attachmentRange");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v10 = 0;
      if (v4)
        goto LABEL_5;
LABEL_12:
      v15 = 0;
      goto LABEL_17;
    }
  }
  -[UITextRange _attachmentRange](self, "_attachmentRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_attachmentRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  v10 = v9 ^ 1;
  if (!v4)
    goto LABEL_12;
LABEL_5:
  -[_UITextKitTextRange start](self, "start");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "start");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isEqual:", v12))
  {
    -[_UITextKitTextRange end](self, "end");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "end");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (((objc_msgSend(v13, "isEqual:", v14) ^ 1 | v10) & 1) != 0)
    {
      v15 = 0;
    }
    else
    {
      -[_UITextKitTextRange textKit2Ranges](self, "textKit2Ranges");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");
      objc_msgSend(v4, "textKit2Ranges");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17 == objc_msgSend(v18, "count"))
      {
        v15 = 1;
      }
      else
      {
        -[_UITextKitTextRange textKit2Ranges](self, "textKit2Ranges");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "textKit2Ranges");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v19, "isEqualToArray:", v20);

      }
    }

  }
  else
  {
    v15 = 0;
  }

LABEL_17:
  return v15;
}

- (NSArray)textKit2Ranges
{
  return self->_textKit2Ranges;
}

+ (id)rangeWithRange:(_NSRange)a3 affinity:(int64_t)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v8;
  void *v9;
  void *v10;

  length = a3.length;
  location = a3.location;
  +[_UITextKitTextPosition positionWithOffset:affinity:](_UITextKitTextPosition, "positionWithOffset:affinity:", a3.location, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UITextKitTextPosition positionWithOffset:affinity:](_UITextKitTextPosition, "positionWithOffset:affinity:", location + length, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "rangeWithStart:end:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)rangeWithRange:(_NSRange)a3
{
  return (id)objc_msgSend(a1, "rangeWithRange:affinity:", a3.location, a3.length, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;

  +[_UITextKitTextPosition positionWithOffset:](_UITextKitTextPosition, "positionWithOffset:", -[_UITextKitTextPosition offset](self->_start, "offset", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UITextKitTextPosition positionWithOffset:](_UITextKitTextPosition, "positionWithOffset:", -[_UITextKitTextPosition offset](self->_end, "offset"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UITextKitTextRange rangeWithStart:end:](_UITextKitTextRange, "rangeWithStart:end:", v4, v5);
  v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  v7 = -[NSArray copy](self->_textKit2Ranges, "copy");
  v8 = (void *)v6[4];
  v6[4] = v7;

  return v6;
}

- (_NSRange)asRange
{
  int64_t v3;
  int64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  _NSRange result;

  v3 = -[_UITextKitTextPosition offset](self->_start, "offset");
  v4 = -[_UITextKitTextPosition offset](self->_end, "offset");
  v5 = v4 - -[_UITextKitTextPosition offset](self->_start, "offset");
  v6 = v3;
  result.length = v5;
  result.location = v6;
  return result;
}

- (unint64_t)hash
{
  int64_t v3;
  int64_t v4;

  v3 = -[_UITextKitTextPosition offset](self->_start, "offset");
  v4 = -[_UITextKitTextPosition offset](self->_end, "offset") + v3;
  return -[NSArray count](self->_textKit2Ranges, "count") ^ v4;
}

- (id)description
{
  void *v3;
  void *v4;
  int64_t v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)_UITextKitTextRange;
  -[_UITextKitTextRange description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_UITextKitTextPosition offset](self->_start, "offset");
  v6 = -[_UITextKitTextPosition offset](self->_end, "offset");
  v7 = v6 - -[_UITextKitTextPosition offset](self->_start, "offset");
  -[_UITextKitTextRange textKit2Ranges](self, "textKit2Ranges");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%li, %li) %lu textKit2 ranges"), v4, v5, v7, objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)setTextKit2Ranges:(id)a3
{
  objc_storeStrong((id *)&self->_textKit2Ranges, a3);
}

@end
