@implementation NSMultiPartInputStream

+ (id)pathMimeType:(const void *)a3
{
  void *v3;
  __CFString *v4;
  const __CFString *PreferredIdentifierForTag;
  __CFString *v6;
  __CFString *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString ps_stringWithSTL:](NSString, "ps_stringWithSTL:", a3));
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pathExtension"));
  PreferredIdentifierForTag = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, v4, 0);
  v6 = (__CFString *)PreferredIdentifierForTag;
  if (!PreferredIdentifierForTag)
  {
    NSLog(CFSTR("Couldn't determine UTI of %@.  Using default."), v3);
    goto LABEL_5;
  }
  v7 = (__CFString *)UTTypeCopyPreferredTagWithClass(PreferredIdentifierForTag, kUTTagClassMIMEType);
  if (!v7)
  {
    NSLog(CFSTR("Couldn't determine mime-type of %@.  Using default."), v3);
LABEL_5:
    v7 = CFSTR("application/octet-stream");
  }

  return v7;
}

- (NSMultiPartInputStream)init
{
  NSMultiPartInputStream *v2;
  NSMultiPartInputStream *v3;
  void *v4;
  uint64_t v5;
  NSString *fMultiPartBoundary;
  void *v7;
  NSInputStream *v8;
  NSInputStream *first;
  NSInputStream *v11;
  unint64_t v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)NSMultiPartInputStream;
  v2 = -[NSMultiPartInputStream init](&v13, "init");
  v3 = v2;
  if (v2)
  {
    v2->fCurrentPart = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "globallyUniqueString"));
    fMultiPartBoundary = v3->fMultiPartBoundary;
    v3->fMultiPartBoundary = (NSString *)v5;

    v3->fNumBytesRead = 0;
    v3->fLength = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\r\n--%@--\r\n"), v3->fMultiPartBoundary));
    +[NSInputStream ps_inputStreamWithString:](NSInputStream, "ps_inputStreamWithString:", v7);
    v8 = v11;
    v11 = 0;
    first = v3->fEpilogueBoundary.first;
    v3->fEpilogueBoundary.first = v8;

    v3->fEpilogueBoundary.second = v12;
  }
  return v3;
}

- (void)addPart:(id)a3 withPath:(const void *)a4
{
  id v6;
  void *v7;
  void *__p[2];
  char v9;

  v6 = a3;
  sub_1000C1E68(a4, (uint64_t)__p);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString ps_stringWithSTL:](NSString, "ps_stringWithSTL:", __p));
  if (v9 < 0)
    operator delete(__p[0]);
  -[NSMultiPartInputStream addPart:withPath:andFilename:](self, "addPart:withPath:andFilename:", v6, a4, v7);

}

- (void)addPart:(id)a3 withPath:(const void *)a4 andFilename:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  id v13;
  id v14;
  id v15;
  char *v16;
  char *v17;
  void *v18;
  void *v19;
  void *__p;
  char *v21;
  _QWORD *v22;
  id v23[2];

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMultiPartInputStream pathMimeType:](NSMultiPartInputStream, "pathMimeType:", a4));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMultiPartInputStream createHeaderName:filename:mimeType:](self, "createHeaderName:filename:mimeType:", v8, v9, v10));
  +[NSInputStream ps_inputStreamWithFileAtPath:](NSInputStream, "ps_inputStreamWithFileAtPath:", a4);
  v12 = operator new(0x10uLL);
  __p = v12;
  v22 = v12 + 2;
  v13 = v23[0];
  v15 = v23[0];
  v14 = v23[1];
  *v12 = v13;
  v12[1] = v14;
  v21 = (char *)(v12 + 2);

  +[NSInputStream ps_inputStreamWithString:](NSInputStream, "ps_inputStreamWithString:", v11);
  -[NSMultiPartInputStream addMultiPart:withHeader:](self, "addMultiPart:withHeader:", &__p, v23);

  v16 = (char *)__p;
  if (__p)
  {
    v17 = v21;
    v18 = __p;
    if (v21 != __p)
    {
      do
      {
        v19 = (void *)*((_QWORD *)v17 - 2);
        v17 -= 16;

      }
      while (v17 != v16);
      v18 = __p;
    }
    v21 = v16;
    operator delete(v18);
  }

}

- (id)createHeaderName:(id)a3 filename:(id)a4 mimeType:(id)a5
{
  return objc_autoreleaseReturnValue((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Content-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\nContent-Type: %@\r\n\r\n"),
                                             a3,
                                             a4,
                                             a5)));
}

- (void)addPart:(id)a3 withData:(const void *)a4 andFilename:(id)a5
{
  void *v7;
  id v8[2];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMultiPartInputStream createHeaderName:filename:mimeType:](self, "createHeaderName:filename:mimeType:", a3, a5, CFSTR("application/octet-stream")));
  +[NSInputStream ps_inputStreamWithString:](NSInputStream, "ps_inputStreamWithString:", v7);
  -[NSMultiPartInputStream addMultiPart:withHeader:](self, "addMultiPart:withHeader:", a4, v8);

}

- (void)addMultiPart:(const void *)a3 withHeader:(const void *)a4
{
  void *v7;
  id *var0;
  __end_cap_ **v9;
  __end_cap_ **v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14[2];

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("--%@\r\n"), self->fMultiPartBoundary));
  +[NSInputStream ps_inputStreamWithString:](NSInputStream, "ps_inputStreamWithString:", v7);
  var0 = (id *)self->fParts.var0;
  if (var0 >= self->fParts.var1.__value_)
  {
    v9 = (__end_cap_ **)sub_10031334C(&self->fParts.__begin_, v14);
    self->fParts.var0 = v9;
    if ((id *)v9 < self->fParts.var1.__value_)
    {
LABEL_3:
      *v9 = (__end_cap_ *)*(id *)a4;
      v10 = v9 + 1;
      self->fParts.var0 = v10;
      v12 = *(_QWORD *)a3;
      v11 = *((_QWORD *)a3 + 1);
      if (v12 != v11)
        goto LABEL_4;
LABEL_11:
      v13 = 0;
      goto LABEL_12;
    }
  }
  else
  {
    *var0 = v14[0];
    v9 = (__end_cap_ **)(var0 + 1);
    self->fParts.var0 = v9;
    if ((id *)v9 < self->fParts.var1.__value_)
      goto LABEL_3;
  }
  v10 = (__end_cap_ **)sub_10031334C(&self->fParts.__begin_, (id *)a4);
  self->fParts.var0 = v10;
  v12 = *(_QWORD *)a3;
  v11 = *((_QWORD *)a3 + 1);
  if (v12 == v11)
    goto LABEL_11;
LABEL_4:
  v13 = 0;
  do
  {
    if ((id *)v10 < self->fParts.var1.__value_)
      *v10++ = (__end_cap_ *)*(id *)v12;
    else
      v10 = (__end_cap_ **)sub_10031334C(&self->fParts.__begin_, (id *)v12);
    self->fParts.var0 = v10;
    v13 += *(_QWORD *)(v12 + 8);
    v12 += 16;
  }
  while (v12 != v11);
LABEL_12:
  -[NSMultiPartInputStream addLength:](self, "addLength:", (char *)v14[1] + v13 + *((_QWORD *)a4 + 1));

}

- (void)addLength:(unint64_t)a3
{
  self->fLength += a3;
}

- (id)boundary
{
  return self->fMultiPartBoundary;
}

- (unint64_t)length
{
  return self->fEpilogueBoundary.second + self->fLength;
}

- (void)open
{
  vector<NSInputStream *, std::allocator<NSInputStream *>> *p_fParts;
  pair<NSInputStream *, unsigned long> *p_fEpilogueBoundary;
  id *var0;
  __end_cap_ **v6;
  NSInputStream *first;
  unint64_t fCurrentPart;

  p_fParts = &self->fParts;
  p_fEpilogueBoundary = &self->fEpilogueBoundary;
  var0 = (id *)self->fParts.var0;
  if (var0 >= self->fParts.var1.__value_)
  {
    v6 = (__end_cap_ **)sub_10031334C(&self->fParts.__begin_, (id *)&p_fEpilogueBoundary->first);
  }
  else
  {
    *var0 = p_fEpilogueBoundary->first;
    v6 = (__end_cap_ **)(var0 + 1);
  }
  p_fParts->var0 = v6;
  -[NSMultiPartInputStream addLength:](self, "addLength:", p_fEpilogueBoundary->second);
  first = p_fEpilogueBoundary->first;
  p_fEpilogueBoundary->first = 0;

  p_fEpilogueBoundary->second = 0;
  fCurrentPart = self->fCurrentPart;
  if (fCurrentPart >= p_fParts->var0 - p_fParts->__begin_)
    sub_1001E2FA0();
  -[__end_ open](p_fParts->__begin_[fCurrentPart], "open");
}

- (void)close
{
  __end_ **begin;
  __end_cap_ **i;
  __end_ *v4;

  begin = self->fParts.__begin_;
  for (i = self->fParts.var0; begin != i; ++begin)
  {
    v4 = *begin;
    -[__end_ close](v4, "close");

  }
}

- (int64_t)read:(char *)a3 maxLength:(unint64_t)a4
{
  vector<NSInputStream *, std::allocator<NSInputStream *>> *p_fParts;
  __end_cap_ **var0;
  __end_ **begin;
  unint64_t v10;
  unint64_t *p_fNumBytesRead;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t *p_fCurrentPart;
  unint64_t v17;
  __end_ *v18;
  int64_t v19;
  int64_t v20;
  unint64_t *v21;

  p_fParts = &self->fParts;
  begin = self->fParts.__begin_;
  var0 = self->fParts.var0;
  v10 = -[NSMultiPartInputStream length](self, "length");
  p_fNumBytesRead = &self->fNumBytesRead;
  if (self->fNumBytesRead >= v10 || a4 == 0)
    return 0;
  v13 = v10;
  v14 = 0;
  v15 = var0 - begin;
  p_fCurrentPart = &self->fCurrentPart;
  do
  {
    v17 = *p_fCurrentPart;
    if (*p_fCurrentPart >= v15)
      break;
    if (v17 >= p_fParts->var0 - p_fParts->__begin_)
      sub_1001E2FA0();
    v18 = p_fParts->__begin_[v17];
    if (!-[__end_ streamStatus](v18, "streamStatus"))
      -[__end_ open](v18, "open");
    v19 = (int64_t)-[__end_ read:maxLength:](v18, "read:maxLength:", &a3[v14], a4 - v14);
    v20 = v19;
    if (v19 < 0)
    {
      NSLog(CFSTR("Failed to read part %zu"), *p_fCurrentPart);

      return v20;
    }
    if (v19)
    {
      v14 += v19;
      v21 = p_fNumBytesRead;
    }
    else
    {
      -[__end_ close](v18, "close");
      v21 = p_fCurrentPart;
      v20 = 1;
    }
    *v21 += v20;

  }
  while (*p_fNumBytesRead < v13 && v14 < a4);
  return v14;
}

- (BOOL)hasBytesAvailable
{
  return self->fCurrentPart < self->fParts.var0 - self->fParts.__begin_;
}

- (id)streamError
{
  unint64_t fCurrentPart;
  __end_ **begin;
  __end_cap_ **var0;
  uint64_t v5;
  id *v6;
  id *v7;
  id *v8;

  fCurrentPart = self->fCurrentPart;
  begin = self->fParts.__begin_;
  var0 = self->fParts.var0;
  v5 = (char *)var0 - (char *)begin;
  v6 = (id *)(var0 - 1);
  v7 = (id *)&begin[fCurrentPart];
  if (fCurrentPart >= v5 >> 3)
    v8 = v6;
  else
    v8 = v7;
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*v8, "streamError"));
}

- (unint64_t)streamStatus
{
  unint64_t fCurrentPart;
  __end_ **begin;
  __end_cap_ **var0;
  uint64_t v5;
  id *v6;
  id *v7;
  id *v8;

  fCurrentPart = self->fCurrentPart;
  begin = self->fParts.__begin_;
  var0 = self->fParts.var0;
  v5 = (char *)var0 - (char *)begin;
  v6 = (id *)(var0 - 1);
  v7 = (id *)&begin[fCurrentPart];
  if (fCurrentPart >= v5 >> 3)
    v8 = v6;
  else
    v8 = v7;
  return (unint64_t)objc_msgSend(*v8, "streamStatus");
}

- (BOOL)getBuffer:(char *)a3 length:(unint64_t *)a4
{
  return 0;
}

- (BOOL)_setCFClientFlags:(unint64_t)a3 callback:(void *)a4 context:(id *)a5
{
  return 0;
}

- (void).cxx_destruct
{
  vector<NSInputStream *, std::allocator<NSInputStream *>> *p_fParts;
  __end_ **begin;
  __end_cap_ **var0;
  __end_ **v6;
  void *v7;

  objc_storeStrong((id *)&self->fMultiPartBoundary, 0);
  p_fParts = &self->fParts;
  begin = p_fParts->__begin_;
  if (p_fParts->__begin_)
  {
    var0 = p_fParts->var0;
    v6 = p_fParts->__begin_;
    if (var0 != begin)
    {
      do
      {
        v7 = *--var0;

      }
      while (var0 != begin);
      v6 = p_fParts->__begin_;
    }
    p_fParts->var0 = begin;
    operator delete(v6);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = 0;
  return self;
}

@end
