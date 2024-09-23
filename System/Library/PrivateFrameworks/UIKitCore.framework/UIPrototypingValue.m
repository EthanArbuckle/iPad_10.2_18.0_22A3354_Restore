@implementation UIPrototypingValue

uint64_t __47___UIPrototypingValue_dictionaryRepresentation__block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a3)
    return objc_msgSend(*(id *)(result + 32), "setObject:forKeyedSubscript:", a3, a2);
  return result;
}

@end
