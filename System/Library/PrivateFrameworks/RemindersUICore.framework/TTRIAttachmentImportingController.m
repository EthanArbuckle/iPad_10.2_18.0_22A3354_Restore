@implementation TTRIAttachmentImportingController

- (_TtC15RemindersUICore33TTRIAttachmentImportingController)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  *(_QWORD *)&self->delegate[OBJC_IVAR____TtC15RemindersUICore33TTRIAttachmentImportingController_delegate] = 0;
  swift_unknownObjectWeakInit();
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[TTRIAttachmentImportingController init](&v5, sel_init);
}

- (void).cxx_destruct
{
  sub_1B41F4748((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore33TTRIAttachmentImportingController_delegate);
}

- (void)imagePickerControllerDidCancel:(id)a3
{
  sub_1B47E9448(self, (uint64_t)a2, a3, (uint64_t)&unk_1E67BD410, (uint64_t)sub_1B47E9DEC, (uint64_t)&block_descriptor_68_1);
}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _TtC15RemindersUICore33TTRIAttachmentImportingController *v9;
  id v10;
  _QWORD v11[6];

  type metadata accessor for InfoKey(0);
  sub_1B47E9D0C();
  v6 = sub_1B4906818();
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  *(_QWORD *)(v7 + 24) = self;
  v11[4] = sub_1B47E9D98;
  v11[5] = v7;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 1107296256;
  v11[2] = sub_1B41F41EC;
  v11[3] = &block_descriptor_61_2;
  v8 = _Block_copy(v11);
  v9 = self;
  v10 = a3;
  _s15RemindersUICore21TTRProcessEnvironmentV24dictionaryRepresentationSDyS2SGvg_0();
  swift_release();
  objc_msgSend(v10, sel_dismissViewControllerAnimated_completion_, 1, v8);
  _Block_release(v8);

  swift_bridgeObjectRelease();
}

- (void)documentCameraViewControllerDidCancel:(id)a3
{
  sub_1B47E9448(self, (uint64_t)a2, a3, (uint64_t)&unk_1E67BD370, (uint64_t)sub_1B47E9DEC, (uint64_t)&block_descriptor_54_2);
}

- (void)documentCameraViewController:(id)a3 didFinishWithScan:(id)a4
{
  uint64_t v7;
  void *v8;
  id v9;
  _TtC15RemindersUICore33TTRIAttachmentImportingController *v10;
  id v11;
  _TtC15RemindersUICore33TTRIAttachmentImportingController *v12;
  id v13;
  _QWORD v14[6];

  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a4;
  *(_QWORD *)(v7 + 24) = self;
  v14[4] = sub_1B47E9D94;
  v14[5] = v7;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 1107296256;
  v14[2] = sub_1B41F41EC;
  v14[3] = &block_descriptor_47_0;
  v8 = _Block_copy(v14);
  v9 = a4;
  v10 = self;
  v11 = v9;
  v12 = v10;
  v13 = a3;
  swift_release();
  objc_msgSend(v13, sel_dismissViewControllerAnimated_completion_, 1, v8);
  _Block_release(v8);

}

@end
