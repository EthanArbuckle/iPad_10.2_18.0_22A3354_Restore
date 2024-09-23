@implementation PUPickerAdditionalSelectionState

- (PXObservable)observable
{
  return (PXObservable *)sub_1AAC4766C();
}

- (PXPhotosFileProviderRegisterConfiguration)registerConfiguration
{
  return (PXPhotosFileProviderRegisterConfiguration *)sub_1AAC47698();
}

- (PUPickerAdditionalSelectionState)initWithConfiguration:(id)a3
{
  return (PUPickerAdditionalSelectionState *)sub_1AAC476A4(a3);
}

- (int64_t)userEncodingPolicy
{
  PUPickerAdditionalSelectionState *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  sub_1AAC47BD4();
  v4 = v3;

  return v4;
}

- (void)setUserEncodingPolicy:(int64_t)a3
{
  PUPickerAdditionalSelectionState *v4;

  v4 = self;
  sub_1AAC47C38(a3);

}

- (BOOL)shouldIncludeLocation
{
  PUPickerAdditionalSelectionState *v2;
  char v3;
  char v4;

  v2 = self;
  sub_1AAC47F14();
  v4 = v3;

  return v4 & 1;
}

- (void)setShouldIncludeLocation:(BOOL)a3
{
  PUPickerAdditionalSelectionState *v3;

  v3 = self;
  sub_1AAC47F7C();

}

- (BOOL)shouldIncludeCaption
{
  PUPickerAdditionalSelectionState *v2;
  char v3;
  char v4;

  v2 = self;
  sub_1AAC48388();
  v4 = v3;

  return v4 & 1;
}

- (void)setShouldIncludeCaption:(BOOL)a3
{
  PUPickerAdditionalSelectionState *v3;

  v3 = self;
  sub_1AAC483F0();

}

- (NSNumber)downscalingTargetDimension
{
  PUPickerAdditionalSelectionState *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_1AAC484BC();
  v4 = v3;

  return (NSNumber *)v4;
}

- (void)setDownscalingTargetDimension:(id)a3
{
  id v5;
  PUPickerAdditionalSelectionState *v6;

  v5 = a3;
  v6 = self;
  sub_1AAC48528(a3);

}

- (PUPickerAdditionalSelectionState)init
{
  sub_1AAC48698();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
}

@end
