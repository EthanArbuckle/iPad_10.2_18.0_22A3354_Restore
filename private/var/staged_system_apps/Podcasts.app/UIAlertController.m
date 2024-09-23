@implementation UIAlertController

+ (id)controllerForDeletingStation:(id)a3 fromLibrary:(id)a4 deletionCompletion:(id)a5
{
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;

  v7 = _Block_copy(a5);
  v8 = swift_allocObject(&unk_1004B55B8, 24, 7);
  *(_QWORD *)(v8 + 16) = v7;
  v9 = a3;
  v10 = a4;
  v11 = sub_1001F5E9C(v9, v10, (uint64_t)sub_100048D5C, v8);

  swift_release(v8);
  return v11;
}

@end
