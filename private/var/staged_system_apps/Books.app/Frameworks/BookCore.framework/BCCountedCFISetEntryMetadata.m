@implementation BCCountedCFISetEntryMetadata

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  int64_t v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = -[BCCountedCFISetEntryMetadata characterCount](self, "characterCount");
  if (-[BCCountedCFISetEntryMetadata touchesPrev](self, "touchesPrev"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  if (-[BCCountedCFISetEntryMetadata touchesNext](self, "touchesNext"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@=%p characterCount=%lu touchesPrev=%@ touchesNext=%@>"), v5, self, v6, v7, v8));

  return v9;
}

- (int64_t)characterCount
{
  return self->_characterCount;
}

- (void)setCharacterCount:(int64_t)a3
{
  self->_characterCount = a3;
}

- (BOOL)touchesPrev
{
  return self->_touchesPrev;
}

- (void)setTouchesPrev:(BOOL)a3
{
  self->_touchesPrev = a3;
}

- (BOOL)touchesNext
{
  return self->_touchesNext;
}

- (void)setTouchesNext:(BOOL)a3
{
  self->_touchesNext = a3;
}

@end
