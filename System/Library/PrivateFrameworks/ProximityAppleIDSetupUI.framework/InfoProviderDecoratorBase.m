@implementation InfoProviderDecoratorBase

- (void)fetchManifestWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[6];

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = *(void **)self->underlyingInfoProvider;
  v8[4] = sub_220D6E72C;
  v8[5] = v5;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 1107296256;
  v8[2] = sub_220D6D7C8;
  v8[3] = &block_descriptor_51;
  v7 = _Block_copy(v8);
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_fetchManifestWithCompletion_, v7);
  _Block_release(v7);
  swift_release();
  swift_release();
}

- (void)fetchViewDetailsWithDevicePair:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[6];

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = *(void **)self->underlyingInfoProvider;
  v11[4] = sub_220D6E748;
  v11[5] = v7;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 1107296256;
  v11[2] = sub_220D6D7C8;
  v11[3] = &block_descriptor_45;
  v9 = _Block_copy(v11);
  v10 = a3;
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v8, sel_fetchViewDetailsWithDevicePair_completion_, v10, v9);
  _Block_release(v9);

  swift_release();
  swift_release();
}

- (void)authenticateWithAccount:(id)a3 with:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[6];

  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = *(void **)self->underlyingInfoProvider;
  v14[4] = sub_220D6E744;
  v14[5] = v9;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 1107296256;
  v14[2] = sub_220D6DA84;
  v14[3] = &block_descriptor_39;
  v11 = _Block_copy(v14);
  v12 = a3;
  v13 = a4;
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v10, sel_authenticateWithAccount_with_completion_, v12, v13, v11);
  _Block_release(v11);

  swift_release();
  swift_release();
}

- (void)signInSucceededWithAccount:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[6];

  v5 = _Block_copy(a4);
  sub_220D99364();
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v5;
  v7 = *(void **)self->underlyingInfoProvider;
  swift_retain();
  v8 = (void *)sub_220D99340();
  v10[4] = sub_220D6E74C;
  v10[5] = v6;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 1107296256;
  v10[2] = sub_220D87F74;
  v10[3] = &block_descriptor_32;
  v9 = _Block_copy(v10);
  swift_retain();
  swift_release();
  objc_msgSend(v7, sel_signInSucceededWithAccount_completion_, v8, v9);
  _Block_release(v9);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

}

- (void)shouldPerformLocalAuthenticationWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[6];

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = *(void **)self->underlyingInfoProvider;
  v8[4] = sub_220D6E724;
  v8[5] = v5;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 1107296256;
  v8[2] = sub_220D6DDF0;
  v8[3] = &block_descriptor_25;
  v7 = _Block_copy(v8);
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_shouldPerformLocalAuthenticationWithCompletion_, v7);
  _Block_release(v7);
  swift_release();
  swift_release();
}

- (void)didPerformLocalAuthenticationWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[6];

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = *(void **)self->underlyingInfoProvider;
  v8[4] = sub_220D6E71C;
  v8[5] = v5;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 1107296256;
  v8[2] = sub_220D87F74;
  v8[3] = &block_descriptor_19;
  v7 = _Block_copy(v8);
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_didPerformLocalAuthenticationWithCompletion_, v7);
  _Block_release(v7);
  swift_release();
  swift_release();
}

@end
