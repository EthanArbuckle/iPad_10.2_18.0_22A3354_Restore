@implementation PRAutocorrectionContext

+ (id)autocorrectionContextOfType:(unint64_t)a3
{
  if (a3 - 2 > 2)
    return 0;
  else
    return objc_alloc_init(*off_1EA8D6FE0[a3 - 2]);
}

+ (void)clearCaches
{
  objc_msgSend((id)_sharedChecker, "clearCaches");
}

- (void)addInputCharacter:(unsigned __int16)a3 geometryData:(id)a4
{
  -[PRAutocorrectionContext addInputCharacter:geometryModel:geometryData:](self, "addInputCharacter:geometryModel:geometryData:", a3, 0, a4);
}

- (void)setModificationMask:(unint64_t)a3
{
  self->_modificationMask = a3;
}

- (unint64_t)modificationMask
{
  return self->_modificationMask;
}

- (id)currentModifications
{
  return 0;
}

- (id)addedModifications
{
  return 0;
}

- (id)removedModifications
{
  return 0;
}

- (id)prefixes
{
  return 0;
}

- (id)guesses
{
  return 0;
}

- (id)completions
{
  return 0;
}

- (id)correction
{
  return 0;
}

- (double)validSequenceCorrectionThreshold
{
  return 0.0;
}

@end
