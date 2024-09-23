@implementation VSRecognitionConfirmAction

- (VSRecognitionConfirmAction)init
{
  VSRecognitionConfirmAction *result;
  objc_super v3;
  objc_super v4;

  if ((*(_BYTE *)&self->_confirmFlags & 1) != 0)
  {
    v4.receiver = self;
    v4.super_class = (Class)VSRecognitionConfirmAction;
    return -[VSRecognitionConfirmAction init](&v4, sel_init);
  }
  else
  {
    *(_BYTE *)&self->_confirmFlags |= 1u;
    v3.receiver = self;
    v3.super_class = (Class)VSRecognitionConfirmAction;
    result = -[VSRecognitionRecognizeAction initWithModelIdentifier:](&v3, sel_initWithModelIdentifier_, CFSTR("com.apple.yn"));
    *(_BYTE *)&result->_confirmFlags &= ~1u;
  }
  return result;
}

- (VSRecognitionConfirmAction)initWithModelIdentifier:(id)a3
{
  VSRecognitionConfirmAction *result;
  objc_super v4;

  *(_BYTE *)&self->_confirmFlags |= 1u;
  v4.receiver = self;
  v4.super_class = (Class)VSRecognitionConfirmAction;
  result = -[VSRecognitionRecognizeAction initWithModelIdentifier:](&v4, sel_initWithModelIdentifier_, CFSTR("com.apple.yn"));
  *(_BYTE *)&result->_confirmFlags &= ~1u;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VSRecognitionConfirmAction;
  -[VSRecognitionRecognizeAction dealloc](&v3, sel_dealloc);
}

- (int)completionType
{
  int result;
  uint64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VSRecognitionConfirmAction;
  result = -[VSRecognitionRecognizeAction completionType](&v5, sel_completionType);
  if ((*(_BYTE *)&self->_confirmFlags & 2) != 0)
    v4 = 112;
  else
    v4 = 120;
  if (!*(Class *)((char *)&self->super.super.super.isa + v4))
    return 0;
  return result;
}

- (void)_setConfirmed:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_confirmFlags = *(_BYTE *)&self->_confirmFlags & 0xFD | v3;
}

- (void)setConfirmedAction:(id)a3
{
  VSRecognitionAction *confirmedAction;

  confirmedAction = self->_confirmedAction;
  if (confirmedAction != a3)
  {

    self->_confirmedAction = (VSRecognitionAction *)a3;
  }
}

- (id)confirmedAction
{
  return self->_confirmedAction;
}

- (void)setDeniedAction:(id)a3
{
  VSRecognitionAction *deniedAction;

  deniedAction = self->_deniedAction;
  if (deniedAction != a3)
  {

    self->_deniedAction = (VSRecognitionAction *)a3;
  }
}

- (id)deniedAction
{
  return self->_deniedAction;
}

@end
