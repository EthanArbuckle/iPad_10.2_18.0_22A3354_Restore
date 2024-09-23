@implementation TokenizerOutputObjc

- (TokenizerOutputObjc)initWithTokenIds:(id)a3 tokenRanges:(id)a4 wordIndexes:(id)a5
{
  id v9;
  id v10;
  id v11;
  TokenizerOutputObjc *v12;
  TokenizerOutputObjc *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TokenizerOutputObjc;
  v12 = -[TokenizerOutputObjc init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_tokenIds, a3);
    objc_storeStrong((id *)&v13->_tokenRanges, a4);
    objc_storeStrong((id *)&v13->_wordIndexes, a5);
  }

  return v13;
}

- (NSData)tokenIds
{
  return self->_tokenIds;
}

- (NSData)tokenRanges
{
  return self->_tokenRanges;
}

- (NSData)wordIndexes
{
  return self->_wordIndexes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wordIndexes, 0);
  objc_storeStrong((id *)&self->_tokenRanges, 0);
  objc_storeStrong((id *)&self->_tokenIds, 0);
}

@end
