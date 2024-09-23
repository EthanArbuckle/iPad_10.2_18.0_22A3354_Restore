@implementation SRSSPhoneticCheckerResult

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SRSSPhoneticCheckerResult text](self, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRSSPhoneticCheckerResult score](self, "score");
  v6 = v5;
  -[SRSSPhoneticCheckerResult phoneticSimilarity](self, "phoneticSimilarity");
  v8 = v7;
  -[SRSSPhoneticCheckerResult prior](self, "prior");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(%f)(%f,%f)\n"), v4, v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
}

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (double)phoneticSimilarity
{
  return self->_phoneticSimilarity;
}

- (void)setPhoneticSimilarity:(double)a3
{
  self->_phoneticSimilarity = a3;
}

- (double)prior
{
  return self->_prior;
}

- (void)setPrior:(double)a3
{
  self->_prior = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
}

@end
