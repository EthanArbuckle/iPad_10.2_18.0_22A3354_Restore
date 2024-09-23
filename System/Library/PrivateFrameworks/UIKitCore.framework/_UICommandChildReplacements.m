@implementation _UICommandChildReplacements

- (void)_setReplacementElements:(id)a3
{
  objc_storeStrong((id *)&self->_replacementElements, a3);
}

- (NSArray)replacementElements
{
  return self->_replacementElements;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replacementElements, 0);
}

@end
