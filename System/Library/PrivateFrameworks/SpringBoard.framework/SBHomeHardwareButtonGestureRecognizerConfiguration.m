@implementation SBHomeHardwareButtonGestureRecognizerConfiguration

- (BOOL)shouldConfigureDependencies
{
  return 1;
}

- (NSArray)allGestureRecognizers
{
  __int128 v3;
  UIHBClickGestureRecognizer *singlePressUpGestureRecognizer;
  __int128 v5;
  UIHBClickGestureRecognizer *doublePressDownGestureRecognizer;
  __int128 v7;
  UIHBClickGestureRecognizer *doubleTapUpGestureRecognizer;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *(_OWORD *)&self->_initialButtonDownGestureRecognizer;
  singlePressUpGestureRecognizer = self->_singlePressUpGestureRecognizer;
  v5 = *(_OWORD *)&self->_acceleratedSinglePressUpGestureRecognizer;
  doublePressDownGestureRecognizer = self->_doublePressDownGestureRecognizer;
  v7 = *(_OWORD *)&self->_doublePressUpGestureRecognizer;
  doubleTapUpGestureRecognizer = self->_doubleTapUpGestureRecognizer;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v3, 9);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (SBSystemGestureManager)systemGestureManager
{
  return self->_systemGestureManager;
}

- (void)setSystemGestureManager:(id)a3
{
  objc_storeStrong((id *)&self->_systemGestureManager, a3);
}

- (UIHBClickGestureRecognizer)initialButtonDownGestureRecognizer
{
  return self->_initialButtonDownGestureRecognizer;
}

- (void)setInitialButtonDownGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_initialButtonDownGestureRecognizer, a3);
}

- (UIHBClickGestureRecognizer)initialButtonUpGestureRecognizer
{
  return self->_initialButtonUpGestureRecognizer;
}

- (void)setInitialButtonUpGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_initialButtonUpGestureRecognizer, a3);
}

- (UIHBClickGestureRecognizer)singlePressUpGestureRecognizer
{
  return self->_singlePressUpGestureRecognizer;
}

- (void)setSinglePressUpGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_singlePressUpGestureRecognizer, a3);
}

- (UIHBClickGestureRecognizer)acceleratedSinglePressUpGestureRecognizer
{
  return self->_acceleratedSinglePressUpGestureRecognizer;
}

- (void)setAcceleratedSinglePressUpGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_acceleratedSinglePressUpGestureRecognizer, a3);
}

- (UIHBLongClickGestureRecognizer)longPressGestureRecognizer
{
  return self->_longPressGestureRecognizer;
}

- (void)setLongPressGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, a3);
}

- (UIHBClickGestureRecognizer)doublePressDownGestureRecognizer
{
  return self->_doublePressDownGestureRecognizer;
}

- (void)setDoublePressDownGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_doublePressDownGestureRecognizer, a3);
}

- (UIHBClickGestureRecognizer)doublePressUpGestureRecognizer
{
  return self->_doublePressUpGestureRecognizer;
}

- (void)setDoublePressUpGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_doublePressUpGestureRecognizer, a3);
}

- (UIHBClickGestureRecognizer)triplePressUpGestureRecognizer
{
  return self->_triplePressUpGestureRecognizer;
}

- (void)setTriplePressUpGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_triplePressUpGestureRecognizer, a3);
}

- (UIHBClickGestureRecognizer)doubleTapUpGestureRecognizer
{
  return self->_doubleTapUpGestureRecognizer;
}

- (void)setDoubleTapUpGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_doubleTapUpGestureRecognizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doubleTapUpGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_triplePressUpGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_doublePressUpGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_doublePressDownGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_acceleratedSinglePressUpGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_singlePressUpGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_initialButtonUpGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_initialButtonDownGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_systemGestureManager, 0);
}

@end
