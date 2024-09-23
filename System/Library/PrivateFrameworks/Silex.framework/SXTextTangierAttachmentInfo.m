@implementation SXTextTangierAttachmentInfo

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (Class)repClass
{
  return (Class)objc_opt_class();
}

- (SXTextExclusionPath)exclusionPath
{
  return self->_exclusionPath;
}

- (void)setExclusionPath:(id)a3
{
  objc_storeStrong((id *)&self->_exclusionPath, a3);
}

- (_NSRange)actualRange
{
  _NSRange *p_actualRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_actualRange = &self->_actualRange;
  location = self->_actualRange.location;
  length = p_actualRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setActualRange:(_NSRange)a3
{
  self->_actualRange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exclusionPath, 0);
}

@end
