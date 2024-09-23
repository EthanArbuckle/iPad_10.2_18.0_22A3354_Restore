@implementation TITokenizationRevision

- (TITokenizationRevision)init
{
  return -[TITokenizationRevision initWithTokenIterator:](self, "initWithTokenIterator:", 0, 0);
}

- (TITokenizationRevision)initWithTokenIterator:(_TIRevisionHistoryTokenIterator)a3
{
  unint64_t documentLocation;
  unint64_t tokenIndex;
  char *v5;
  TITokenizationRevision *v6;
  NSMutableArray *v7;
  NSMutableArray *branchTokens;
  objc_super v10;

  documentLocation = a3.documentLocation;
  tokenIndex = a3.tokenIndex;
  v10.receiver = self;
  v10.super_class = (Class)TITokenizationRevision;
  v5 = -[TITokenizationRevision init](&v10, sel_init);
  v6 = (TITokenizationRevision *)v5;
  if (v5)
  {
    *(_OWORD *)(v5 + 40) = xmmword_1DA910F40;
    *((_QWORD *)v5 + 7) = tokenIndex;
    *((_QWORD *)v5 + 8) = documentLocation;
    *((_QWORD *)v5 + 1) = documentLocation;
    *((int64x2_t *)v5 + 1) = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    branchTokens = v6->_branchTokens;
    v6->_branchTokens = v7;

  }
  return v6;
}

- (_NSRange)originalSelectedTokenRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_originalSelectedTokenRange.length;
  location = self->_originalSelectedTokenRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setOriginalSelectedTokenRange:(_NSRange)a3
{
  self->_originalSelectedTokenRange = a3;
}

- (_TIRevisionHistoryTokenIterator)originalIterator
{
  unint64_t documentLocation;
  unint64_t tokenIndex;
  _TIRevisionHistoryTokenIterator result;

  documentLocation = self->_originalIterator.documentLocation;
  tokenIndex = self->_originalIterator.tokenIndex;
  result.documentLocation = documentLocation;
  result.tokenIndex = tokenIndex;
  return result;
}

- (void)setOriginalIterator:(_TIRevisionHistoryTokenIterator)a3
{
  self->_originalIterator = a3;
}

- (unint64_t)revisedDocumentLocation
{
  return self->_revisedDocumentLocation;
}

- (void)setRevisedDocumentLocation:(unint64_t)a3
{
  self->_revisedDocumentLocation = a3;
}

- (unint64_t)branchedTokenIndex
{
  return self->_branchedTokenIndex;
}

- (void)setBranchedTokenIndex:(unint64_t)a3
{
  self->_branchedTokenIndex = a3;
}

- (unint64_t)mergedTokenIndex
{
  return self->_mergedTokenIndex;
}

- (void)setMergedTokenIndex:(unint64_t)a3
{
  self->_mergedTokenIndex = a3;
}

- (NSMutableArray)branchTokens
{
  return self->_branchTokens;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_branchTokens, 0);
}

@end
