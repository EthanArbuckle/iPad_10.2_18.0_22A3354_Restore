@implementation UIBuiltinTraitStorageHash

uint64_t ___UIBuiltinTraitStorageHash_block_invoke(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  if (*a2 < 0)
    v2 = -v2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += 2654435761 * v2;
  return result;
}

long double ___UIBuiltinTraitStorageHash_block_invoke_3(uint64_t a1, double *a2)
{
  double v3;
  long double v4;
  unint64_t v5;
  long double result;

  if (*a2 >= 0.0)
    v3 = *a2;
  else
    v3 = -*a2;
  v4 = floor(v3 + 0.5);
  v5 = (unint64_t)fmod(v4, 1.84467441e19);
  result = v3 - v4;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += vcvtd_n_u64_f64(v3 - v4, 0x40uLL) + 2654435761u * v5;
  return result;
}

uint64_t ___UIBuiltinTraitStorageHash_block_invoke_2(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  if (*a2 < 0)
    v2 = -v2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += 2654435761 * v2;
  return result;
}

@end
