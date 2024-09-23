@implementation _SiriPresentationOptionsMutation

- (_SiriPresentationOptionsMutation)init
{
  return -[_SiriPresentationOptionsMutation initWithBaseModel:](self, "initWithBaseModel:", 0);
}

- (_SiriPresentationOptionsMutation)initWithBaseModel:(id)a3
{
  id v5;
  _SiriPresentationOptionsMutation *v6;
  _SiriPresentationOptionsMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SiriPresentationOptionsMutation;
  v6 = -[_SiriPresentationOptionsMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_baseModel, a3);

  return v7;
}

- (void)setWakeScreen:(BOOL)a3
{
  self->_wakeScreen = a3;
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (void)setHideOtherWindowsDuringAppearance:(BOOL)a3
{
  self->_hideOtherWindowsDuringAppearance = a3;
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (void)setShouldAllowBiometricAutoUnlock:(BOOL)a3
{
  self->_shouldAllowBiometricAutoUnlock = a3;
  *(_BYTE *)&self->_mutationFlags |= 9u;
}

- (void)setShouldDeactivateScenesBelow:(BOOL)a3
{
  self->_shouldDeactivateScenesBelow = a3;
  *(_BYTE *)&self->_mutationFlags |= 0x11u;
}

- (void)setRotationStyle:(int64_t)a3
{
  self->_rotationStyle = a3;
  *(_BYTE *)&self->_mutationFlags |= 0x21u;
}

- (void)setRequestSource:(int64_t)a3
{
  self->_requestSource = a3;
  *(_BYTE *)&self->_mutationFlags |= 0x41u;
}

- (void)setInputType:(int64_t)a3
{
  self->_inputType = a3;
  *(_BYTE *)&self->_mutationFlags |= 0x81u;
}

- (id)generate
{
  SiriPresentationOptions *baseModel;
  char mutationFlags;
  SiriPresentationOptions *v5;
  SiriPresentationOptions *v6;
  _BOOL8 v7;
  int64_t v8;
  int64_t v9;
  uint64_t wakeScreen;
  _BOOL8 hideOtherWindowsDuringAppearance;
  _BOOL8 shouldAllowBiometricAutoUnlock;
  _BOOL8 shouldDeactivateScenesBelow;
  int64_t rotationStyle;
  int64_t requestSource;
  int64_t inputType;
  int64_t v17;

  baseModel = self->_baseModel;
  if (baseModel)
  {
    mutationFlags = (char)self->_mutationFlags;
    if ((mutationFlags & 1) == 0)
    {
      v5 = (SiriPresentationOptions *)-[SiriPresentationOptions copy](baseModel, "copy");
      return v5;
    }
    if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
    {
      wakeScreen = self->_wakeScreen;
      if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
      {
LABEL_10:
        hideOtherWindowsDuringAppearance = self->_hideOtherWindowsDuringAppearance;
        if ((mutationFlags & 8) != 0)
          goto LABEL_11;
        goto LABEL_23;
      }
    }
    else
    {
      wakeScreen = -[SiriPresentationOptions wakeScreen](baseModel, "wakeScreen");
      mutationFlags = (char)self->_mutationFlags;
      if ((mutationFlags & 4) != 0)
        goto LABEL_10;
    }
    hideOtherWindowsDuringAppearance = -[SiriPresentationOptions hideOtherWindowsDuringAppearance](self->_baseModel, "hideOtherWindowsDuringAppearance");
    mutationFlags = (char)self->_mutationFlags;
    if ((mutationFlags & 8) != 0)
    {
LABEL_11:
      shouldAllowBiometricAutoUnlock = self->_shouldAllowBiometricAutoUnlock;
      if ((mutationFlags & 0x10) != 0)
        goto LABEL_12;
      goto LABEL_24;
    }
LABEL_23:
    shouldAllowBiometricAutoUnlock = -[SiriPresentationOptions shouldAllowBiometricAutoUnlock](self->_baseModel, "shouldAllowBiometricAutoUnlock");
    mutationFlags = (char)self->_mutationFlags;
    if ((mutationFlags & 0x10) != 0)
    {
LABEL_12:
      shouldDeactivateScenesBelow = self->_shouldDeactivateScenesBelow;
      if ((mutationFlags & 0x20) != 0)
        goto LABEL_13;
      goto LABEL_25;
    }
LABEL_24:
    shouldDeactivateScenesBelow = -[SiriPresentationOptions shouldDeactivateScenesBelow](self->_baseModel, "shouldDeactivateScenesBelow");
    mutationFlags = (char)self->_mutationFlags;
    if ((mutationFlags & 0x20) != 0)
    {
LABEL_13:
      rotationStyle = self->_rotationStyle;
      if ((mutationFlags & 0x40) != 0)
        goto LABEL_14;
      goto LABEL_26;
    }
LABEL_25:
    rotationStyle = -[SiriPresentationOptions rotationStyle](self->_baseModel, "rotationStyle");
    mutationFlags = (char)self->_mutationFlags;
    if ((mutationFlags & 0x40) != 0)
    {
LABEL_14:
      requestSource = self->_requestSource;
      if (mutationFlags < 0)
      {
LABEL_15:
        inputType = self->_inputType;
LABEL_28:
        v5 = -[SiriPresentationOptions initWithWakeScreen:hideOtherWindowsDuringAppearance:shouldAllowBiometricAutoUnlock:shouldDeactivateScenesBelow:rotationStyle:requestSource:inputType:]([SiriPresentationOptions alloc], "initWithWakeScreen:hideOtherWindowsDuringAppearance:shouldAllowBiometricAutoUnlock:shouldDeactivateScenesBelow:rotationStyle:requestSource:inputType:", wakeScreen, hideOtherWindowsDuringAppearance, shouldAllowBiometricAutoUnlock, shouldDeactivateScenesBelow, rotationStyle, requestSource, inputType);
        return v5;
      }
LABEL_27:
      inputType = -[SiriPresentationOptions inputType](self->_baseModel, "inputType");
      goto LABEL_28;
    }
LABEL_26:
    requestSource = -[SiriPresentationOptions requestSource](self->_baseModel, "requestSource");
    if ((*(_BYTE *)&self->_mutationFlags & 0x80) != 0)
      goto LABEL_15;
    goto LABEL_27;
  }
  v6 = [SiriPresentationOptions alloc];
  if ((*(_BYTE *)&self->_mutationFlags & 2) == 0)
  {
    v7 = 1;
    if ((*(_BYTE *)&self->_mutationFlags & 0x20) != 0)
      goto LABEL_6;
LABEL_17:
    v8 = 1;
    if ((*(_BYTE *)&self->_mutationFlags & 0x40) != 0)
      goto LABEL_7;
LABEL_18:
    v9 = 0;
    goto LABEL_19;
  }
  v7 = self->_wakeScreen;
  if ((*(_BYTE *)&self->_mutationFlags & 0x20) == 0)
    goto LABEL_17;
LABEL_6:
  v8 = self->_rotationStyle;
  if ((*(_BYTE *)&self->_mutationFlags & 0x40) == 0)
    goto LABEL_18;
LABEL_7:
  v9 = self->_requestSource;
LABEL_19:
  if ((*(_BYTE *)&self->_mutationFlags & 0x80) != 0)
    v17 = self->_inputType;
  else
    v17 = 0;
  v5 = -[SiriPresentationOptions initWithWakeScreen:hideOtherWindowsDuringAppearance:shouldAllowBiometricAutoUnlock:shouldDeactivateScenesBelow:rotationStyle:requestSource:inputType:](v6, "initWithWakeScreen:hideOtherWindowsDuringAppearance:shouldAllowBiometricAutoUnlock:shouldDeactivateScenesBelow:rotationStyle:requestSource:inputType:", v7, self->_hideOtherWindowsDuringAppearance, self->_shouldAllowBiometricAutoUnlock, self->_shouldDeactivateScenesBelow, v8, v9, v17);
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseModel, 0);
}

@end
