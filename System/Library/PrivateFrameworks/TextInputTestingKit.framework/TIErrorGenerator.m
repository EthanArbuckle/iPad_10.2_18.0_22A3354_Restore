@implementation TIErrorGenerator

- (TIErrorGenerator)initWithAttributes:(id)a3
{
  id v4;
  TIErrorGenerator *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  float v10;
  void *v11;
  float v12;
  void *v13;
  float v14;
  void *v15;
  void *v16;
  void *v17;
  float v18;
  void *v19;
  void *v20;
  float v21;
  void *v22;
  void *v23;
  uint64_t v24;
  unsigned int v25;
  uint64_t i;
  _OWORD *v27;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)TIErrorGenerator;
  v5 = -[TIErrorGenerator init](&v29, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("SPACE_HORIZONTAL_ERROR_BIAS"));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!v6)
      v6 = CFSTR("1");
    v5->_spaceHorizontalErrorMode = -[__CFString integerValue](v6, "integerValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("SPACE_VERTICAL_ERROR_BIAS"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8)
      v8 = CFSTR("0.0");
    -[__CFString floatValue](v8, "floatValue");
    v5->_spaceVerticalBias = v10;

    objc_msgSend(v4, "valueForKey:", CFSTR("PROB_SPACE_REPLACED_BY_BOTTOM_ROW"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "floatValue");
    v5->_probTappingSpaceReplacedByBottomRow = v12;

    objc_msgSend(v4, "valueForKey:", CFSTR("PROB_SPACE_INSTEAD_OF_BOTTOM_ROW"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "floatValue");
    v5->_probTappingSpaceInsteadOfBottomRow = v14;

    objc_msgSend(v4, "valueForKey:", CFSTR("MAX_SPACE_ERRORS_PER_TEST"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_spacingErrorMaxCount = (int)objc_msgSend(v15, "intValue");

    objc_msgSend(v4, "valueForKey:", CFSTR("REL_ERROR_NUMBERS_PUNCTATION"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (!v16)
      v16 = &unk_24FD5FE08;
    objc_msgSend(v16, "floatValue");
    v5->_relErrorNumbersPunctuation = v18;

    objc_msgSend(v4, "valueForKey:", CFSTR("REL_ERROR_CONTROL_KEYS"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (!v19)
      v19 = &unk_24FD5FE08;
    objc_msgSend(v19, "floatValue");
    v5->_relErrorControlKeys = v21;

    objc_msgSend(v4, "valueForKey:", CFSTR("RNG_SEED_SALT"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (!v22)
      v22 = &unk_24FD5FE18;
    v5->_RNGSeedSalt = objc_msgSend(v22, "integerValue");

    v24 = operator new();
    v25 = 5489;
    *(_DWORD *)v24 = 5489;
    for (i = 1; i != 624; ++i)
    {
      v25 = i + 1812433253 * (v25 ^ (v25 >> 30));
      *(_DWORD *)(v24 + 4 * i) = v25;
    }
    *(_QWORD *)(v24 + 2496) = 0;
    v5->m_generator = (void *)v24;
    v27 = (_OWORD *)operator new();
    *v27 = xmmword_22FAC90C0;
    v5->m_distribution = v27;
    -[TIErrorGenerator setRandomNumberSeed:](v5, "setRandomNumberSeed:", 0);
  }

  return v5;
}

- (TIErrorGenerator)init
{
  return -[TIErrorGenerator initWithAttributes:](self, "initWithAttributes:", MEMORY[0x24BDBD1B8]);
}

- (void)dealloc
{
  void *m_generator;
  void *m_distribution;
  objc_super v5;

  m_generator = self->m_generator;
  if (m_generator)
    MEMORY[0x2348A8A24](m_generator, 0x1000C407BAC9B3ELL);
  m_distribution = self->m_distribution;
  if (m_distribution)
    MEMORY[0x2348A8A24](m_distribution, 0x1000C40451B5BE8);
  v5.receiver = self;
  v5.super_class = (Class)TIErrorGenerator;
  -[TIErrorGenerator dealloc](&v5, sel_dealloc);
}

- (void)reset
{
  -[TIErrorGenerator setSpacingErrorsApplied:](self, "setSpacingErrorsApplied:", 0);
}

- (void)setRandomNumberSeed:(unsigned int)a3
{
  unsigned int v3;
  _DWORD *m_generator;
  uint64_t i;

  v3 = 257 * self->_RNGSeedSalt + a3;
  m_generator = self->m_generator;
  *m_generator = v3;
  for (i = 1; i != 624; ++i)
  {
    v3 = i + 1812433253 * (v3 ^ (v3 >> 30));
    m_generator[i] = v3;
  }
  *((_QWORD *)m_generator + 312) = 0;
  -[TIErrorGenerator reset](self, "reset");
}

- (double)uniformRandomNumber
{
  std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *m_generator;
  double *m_distribution;
  double v4;
  double v5;

  m_generator = (std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *)self->m_generator;
  m_distribution = (double *)self->m_distribution;
  v4 = m_distribution[1] - *m_distribution;
  v5 = (double)std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(m_generator);
  return *m_distribution
       + v4
       * ((v5
         + (double)std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(m_generator)
         * 4294967300.0)
        * 5.42101086e-20);
}

- (CGPoint)uniformRandomPointInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[TIErrorGenerator uniformRandomNumber](self, "uniformRandomNumber");
  v9 = x + v8 * width;
  -[TIErrorGenerator uniformRandomNumber](self, "uniformRandomNumber");
  v11 = y + v10 * height;
  v12 = v9;
  result.y = v11;
  result.x = v12;
  return result;
}

- (CGPoint)persistentBiasForSpaceBarRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  double v10;
  double v11;
  int64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  int64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGPoint result;
  CGRect v25;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = *MEMORY[0x24BDBEFB0];
  v9 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  v10 = CGRectGetHeight(a3);
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  v11 = CGRectGetWidth(v25) - v10;
  v12 = -[TIErrorGenerator spaceHorizontalErrorMode](self, "spaceHorizontalErrorMode");
  v13 = v8 + v11 * -0.5;
  v14 = v8 + v11 * 0.5;
  if (v12 != 2)
    v14 = v8;
  if (v12 == 3)
    v15 = v8 + v11 * -0.5;
  else
    v15 = v14;
  -[TIErrorGenerator spaceVerticalBias](self, "spaceVerticalBias", v13, v14);
  v17 = v9 - v10 * v16;
  v18 = -[TIErrorGenerator spacingErrorsApplied](self, "spacingErrorsApplied");
  if (v18 < -[TIErrorGenerator spacingErrorMaxCount](self, "spacingErrorMaxCount"))
  {
    -[TIErrorGenerator uniformRandomNumber](self, "uniformRandomNumber");
    v20 = v19;
    -[TIErrorGenerator probTappingSpaceReplacedByBottomRow](self, "probTappingSpaceReplacedByBottomRow");
    if (v20 < v21)
    {
      v17 = v17 - v10;
      -[TIErrorGenerator setSpacingErrorsApplied:](self, "setSpacingErrorsApplied:", -[TIErrorGenerator spacingErrorsApplied](self, "spacingErrorsApplied") + 1);
    }
  }
  v22 = v15;
  v23 = v17;
  result.y = v23;
  result.x = v22;
  return result;
}

- (CGPoint)persistentBiasForBottomRow:(CGRect)a3
{
  double v4;
  double v5;
  double Height;
  int64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  v4 = *MEMORY[0x24BDBEFB0];
  v5 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  Height = CGRectGetHeight(a3);
  v7 = -[TIErrorGenerator spacingErrorsApplied](self, "spacingErrorsApplied");
  if (v7 < -[TIErrorGenerator spacingErrorMaxCount](self, "spacingErrorMaxCount"))
  {
    -[TIErrorGenerator uniformRandomNumber](self, "uniformRandomNumber");
    v9 = v8;
    -[TIErrorGenerator probTappingSpaceInsteadOfBottomRow](self, "probTappingSpaceInsteadOfBottomRow");
    if (v9 < v10)
    {
      v5 = v5 + Height;
      -[TIErrorGenerator setSpacingErrorsApplied:](self, "setSpacingErrorsApplied:", -[TIErrorGenerator spacingErrorsApplied](self, "spacingErrorsApplied") + 1);
    }
  }
  v11 = v4;
  v12 = v5;
  result.y = v12;
  result.x = v11;
  return result;
}

- (CGPoint)globalBias
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *MEMORY[0x24BDBEFB0];
  v3 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)persistentBiasForKeyString:(id)a3 rect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  double v10;
  double v11;
  void *v12;
  int v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGPoint result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR(" ")))
  {
    -[TIErrorGenerator persistentBiasForSpaceBarRect:](self, "persistentBiasForSpaceBarRect:", x, y, width, height);
  }
  else
  {
    -[TIErrorGenerator keyboardInfoDelgate](self, "keyboardInfoDelgate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isKeyStringAboveSpaceBar:", v9);

    if (!v13)
    {
      v14 = *MEMORY[0x24BDBEFB0];
      v15 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
      goto LABEL_7;
    }
    -[TIErrorGenerator persistentBiasForBottomRow:](self, "persistentBiasForBottomRow:", x, y, width, height);
  }
  v14 = v10;
  v15 = v11;
LABEL_7:

  v16 = v14;
  v17 = v15;
  result.y = v17;
  result.x = v16;
  return result;
}

- (CGPoint)randomErrorForKeyString:(id)a3 rect:(CGRect)a4
{
  double v4;
  double v5;
  CGPoint result;

  v4 = *MEMORY[0x24BDBEFB0];
  v5 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  result.y = v5;
  result.x = v4;
  return result;
}

- (id)errorForKeyString:(id)a3 rect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  NSString *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  float relErrorNumbersPunctuation;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  float relErrorControlKeys;
  double v25;
  void *v26;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = (NSString *)a3;
  -[TIErrorGenerator globalBias](self, "globalBias");
  v11 = v10;
  v13 = v12;
  if (_isNumberPunctationKey(v9))
  {
    relErrorNumbersPunctuation = self->_relErrorNumbersPunctuation;
  }
  else
  {
    if (!_isControlKey(v9))
      goto LABEL_6;
    relErrorNumbersPunctuation = self->_relErrorControlKeys;
  }
  v15 = relErrorNumbersPunctuation;
  v11 = v11 * v15;
  v13 = v13 * v15;
LABEL_6:
  -[TIErrorGenerator persistentBiasForKeyString:rect:](self, "persistentBiasForKeyString:rect:", v9, x, y, width, height);
  v17 = v16;
  v19 = v18;
  -[TIErrorGenerator randomErrorForKeyString:rect:](self, "randomErrorForKeyString:rect:", v9, x, y, width, height);
  v21 = v20;
  v23 = v22;
  if (_isNumberPunctationKey(v9))
  {
    relErrorControlKeys = self->_relErrorNumbersPunctuation;
LABEL_10:
    v25 = relErrorControlKeys;
    v21 = v21 * v25;
    v23 = v23 * v25;
    goto LABEL_11;
  }
  if (_isControlKey(v9))
  {
    relErrorControlKeys = self->_relErrorControlKeys;
    goto LABEL_10;
  }
LABEL_11:
  +[TIPointError errorWithErrorVector:](TIPointError, "errorWithErrorVector:", v11 + 0.0 + v17 + v21, v13 + 0.0 + v19 + v23);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (CGPoint)randomPointInDistribution
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  -[TIErrorGenerator uniformRandomNumber](self, "uniformRandomNumber");
  v4 = v3;
  -[TIErrorGenerator uniformRandomNumber](self, "uniformRandomNumber");
  v6 = v5;
  v7 = v4;
  result.y = v6;
  result.x = v7;
  return result;
}

- (int64_t)spaceHorizontalErrorMode
{
  return self->_spaceHorizontalErrorMode;
}

- (void)setSpaceHorizontalErrorMode:(int64_t)a3
{
  self->_spaceHorizontalErrorMode = a3;
}

- (double)spaceVerticalBias
{
  return self->_spaceVerticalBias;
}

- (void)setSpaceVerticalBias:(double)a3
{
  self->_spaceVerticalBias = a3;
}

- (double)probTappingSpaceInsteadOfBottomRow
{
  return self->_probTappingSpaceInsteadOfBottomRow;
}

- (void)setProbTappingSpaceInsteadOfBottomRow:(double)a3
{
  self->_probTappingSpaceInsteadOfBottomRow = a3;
}

- (double)probTappingSpaceReplacedByBottomRow
{
  return self->_probTappingSpaceReplacedByBottomRow;
}

- (void)setProbTappingSpaceReplacedByBottomRow:(double)a3
{
  self->_probTappingSpaceReplacedByBottomRow = a3;
}

- (TIKeyboardInfoDelegate)keyboardInfoDelgate
{
  return (TIKeyboardInfoDelegate *)objc_loadWeakRetained((id *)&self->_keyboardInfoDelgate);
}

- (void)setKeyboardInfoDelgate:(id)a3
{
  objc_storeWeak((id *)&self->_keyboardInfoDelgate, a3);
}

- (int64_t)spacingErrorsApplied
{
  return self->_spacingErrorsApplied;
}

- (void)setSpacingErrorsApplied:(int64_t)a3
{
  self->_spacingErrorsApplied = a3;
}

- (int64_t)spacingErrorMaxCount
{
  return self->_spacingErrorMaxCount;
}

- (void)setSpacingErrorMaxCount:(int64_t)a3
{
  self->_spacingErrorMaxCount = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_keyboardInfoDelgate);
}

+ (TIErrorGenerator)errorGeneratorWithAttributes:(id)a3
{
  id v3;
  NSString *v4;
  objc_class *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "valueForKey:", CFSTR("ERROR_GENERATOR"));
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  v5 = NSClassFromString(v4);
  if (!v5)
    v5 = (objc_class *)objc_opt_class();
  v6 = (void *)objc_msgSend([v5 alloc], "initWithAttributes:", v3);

  return (TIErrorGenerator *)v6;
}

@end
