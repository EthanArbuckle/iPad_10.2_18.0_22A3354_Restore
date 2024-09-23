@implementation SBRingerButtonParameters

- (SBRingerButtonParameters)init
{
  SBRingerButtonParameters *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBRingerButtonParameters;
  result = -[SBRingerButtonParameters init](&v3, sel_init);
  if (result)
    *(_OWORD *)&result->_longPressTime = xmmword_1D0E89760;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = objc_alloc_init(SBRingerButtonParameters);
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_longPressTime;
  *((_QWORD *)result + 2) = *(_QWORD *)&self->_longPressTimeWhenSuppressed;
  return result;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  SBRingerButtonParameters *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__SBRingerButtonParameters_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_1E8E9E820;
  v7 = v4;
  v8 = self;
  v5 = v4;
  objc_msgSend(v5, "appendProem:block:", 0, v6);

}

id __57__SBRingerButtonParameters_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:", CFSTR("longPressTime"), *(double *)(*(_QWORD *)(a1 + 40) + 8));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:", CFSTR("longPressTimeWhenSuppressed"), *(double *)(*(_QWORD *)(a1 + 40) + 16));
}

- (double)longPressTime
{
  if (a1)
    return *(double *)(a1 + 8);
  else
    return 0.0;
}

- (uint64_t)setLongPressTime:(uint64_t)result
{
  if (result)
    *(double *)(result + 8) = a2;
  return result;
}

- (double)longPressTimeWhenSuppressed
{
  if (a1)
    return *(double *)(a1 + 16);
  else
    return 0.0;
}

- (uint64_t)setLongPressTimeWhenSuppressed:(uint64_t)result
{
  if (result)
    *(double *)(result + 16) = a2;
  return result;
}

- (uint64_t)setViewObstructionEligibility:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 24) = a2;
  return result;
}

@end
