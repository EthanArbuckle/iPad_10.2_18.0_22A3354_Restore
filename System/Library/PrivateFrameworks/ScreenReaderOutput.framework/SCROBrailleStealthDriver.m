@implementation SCROBrailleStealthDriver

- (SCROBrailleStealthDriver)init
{
  SCROBrailleStealthDriver *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCROBrailleStealthDriver;
  result = -[SCROBrailleStealthDriver init](&v3, sel_init);
  if (result)
    result->_isDriverLoaded = 0;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[SCROBrailleStealthDriver unloadDriver](self, "unloadDriver");
  v3.receiver = self;
  v3.super_class = (Class)SCROBrailleStealthDriver;
  -[SCROBrailleStealthDriver dealloc](&v3, sel_dealloc);
}

- (unint64_t)interfaceVersion
{
  return 4;
}

- (int)loadDriverWithIOElement:(id)a3
{
  NSString *modelIdentifier;

  if (self->_isDriverLoaded)
    -[SCROBrailleStealthDriver unloadDriver](self, "unloadDriver", a3);
  modelIdentifier = self->_modelIdentifier;
  self->_modelIdentifier = (NSString *)CFSTR("com.apple.scrod.braille.driver.stealth.caption");

  *(_OWORD *)&self->_mainSize = xmmword_211601B60;
  self->_isDriverLoaded = 1;
  return 0;
}

- (BOOL)unloadDriver
{
  if (self->_isDriverLoaded)
    self->_isDriverLoaded = 0;
  return 1;
}

- (BOOL)isDriverLoaded
{
  return 0;
}

- (BOOL)isSleeping
{
  return 0;
}

- (id)modelIdentifier
{
  return self->_modelIdentifier;
}

- (BOOL)supportsBlinkingCursor
{
  return 0;
}

- (BOOL)isInputEnabled
{
  return 0;
}

- (BOOL)postsKeyboardEvents
{
  return 0;
}

- (int)brailleInputMode
{
  return 0;
}

- (int64_t)mainSize
{
  return self->_mainSize;
}

- (int64_t)statusSize
{
  return self->_statusSize;
}

- (id)getInputEvents
{
  return 0;
}

- (BOOL)setMainCells:(const char *)a3 length:(int64_t)a4
{
  return 1;
}

- (BOOL)setStatusCells:(const char *)a3 length:(int64_t)a4
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelIdentifier, 0);
}

@end
