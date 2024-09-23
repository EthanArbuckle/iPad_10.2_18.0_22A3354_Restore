@implementation PFLCCurationScore

- (PFLCCurationScore)initWithPositionScores:(id)a3 preferredPosition:(unint64_t)a4
{
  id v6;
  PFLCCurationScore *v7;
  uint64_t v8;
  NSDictionary *positionScores;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PFLCCurationScore;
  v7 = -[PFLCCurationScore init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    positionScores = v7->_positionScores;
    v7->_positionScores = (NSDictionary *)v8;

    v7->_preferredPosition = a4;
  }

  return v7;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("CurationScore[ positionScores=\n%@\n, preferred=%ld ]"), self->_positionScores, self->_preferredPosition);
}

- (NSDictionary)positionScores
{
  return self->_positionScores;
}

- (unint64_t)preferredPosition
{
  return self->_preferredPosition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_positionScores, 0);
}

@end
