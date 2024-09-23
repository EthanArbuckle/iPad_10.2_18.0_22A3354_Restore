@implementation MTTestActionContentPickerPresenter

- (void)pickerDoneWithSender:(id)a3
{
  sub_10029B664((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, __n128))sub_10029B4A0);
}

- (void)pickerCancelWithSender:(id)a3
{
  sub_10029B664((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, __n128))sub_10029B584);
}

@end
