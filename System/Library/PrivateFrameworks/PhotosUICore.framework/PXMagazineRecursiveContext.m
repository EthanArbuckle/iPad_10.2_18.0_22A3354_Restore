@implementation PXMagazineRecursiveContext

- (NSMutableArray)generatedChunks
{
  return self->_generatedChunks;
}

- (void)setGeneratedChunks:(id)a3
{
  objc_storeStrong((id *)&self->_generatedChunks, a3);
}

- (PXNewMagazineRectArray)outRectArray
{
  return self->_outRectArray;
}

- (void)setOutRectArray:(id)a3
{
  objc_storeStrong((id *)&self->_outRectArray, a3);
}

- (PXNewMagazineRectArray)fallbackRectArray
{
  return self->_fallbackRectArray;
}

- (void)setFallbackRectArray:(id)a3
{
  objc_storeStrong((id *)&self->_fallbackRectArray, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackRectArray, 0);
  objc_storeStrong((id *)&self->_outRectArray, 0);
  objc_storeStrong((id *)&self->_generatedChunks, 0);
}

@end
