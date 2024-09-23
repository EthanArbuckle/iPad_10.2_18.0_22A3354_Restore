@implementation _SEExtensionProcess

- (id)grantCapability:(id)a3 error:(id *)a4
{
  return sub_245DB442C(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(_QWORD *__return_ptr, id))sub_245DB44F8);
}

- (void)invalidate
{
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  _SEExtensionProcess *v6;
  _QWORD v7[3];
  uint64_t v8;
  uint64_t v9;

  (*(void (**)(_QWORD *__return_ptr))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.isa) + 0x50))(v7);
  v3 = v8;
  v4 = v9;
  __swift_project_boxed_opaque_existential_1(v7, v8);
  v5 = *(void (**)(uint64_t, uint64_t))(v4 + 40);
  v6 = self;
  v5(v3, v4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);

}

- (id)makeLibXPCConnectionError:(id *)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  _SEExtensionProcess *v7;
  void *v8;
  _QWORD v10[3];
  uint64_t v11;
  uint64_t v12;

  (*(void (**)(_QWORD *__return_ptr))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.isa) + 0x50))(v10);
  v4 = v11;
  v5 = v12;
  __swift_project_boxed_opaque_existential_1(v10, v11);
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 16);
  v7 = self;
  v8 = (void *)v6(v4, v5);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);

  return v8;
}

- (_SEExtensionProcess)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for _SEExtensionProcess();
  return -[_SEExtensionProcess init](&v3, sel_init);
}

- (id)grantCapabilities:(id)a3 error:(id *)a4
{
  return sub_245DB442C(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(_QWORD *__return_ptr, id))sub_245DB44F8);
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  _SEExtensionProcess *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  _SEExtensionProcess *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unsigned int v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  $115C4C562B26FF47E01F9F4EA65B5887 *result;
  _QWORD v19[3];
  uint64_t v20;
  uint64_t v21;

  v3 = self;
  (*(void (**)(_QWORD *__return_ptr))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.isa) + 0x50))(v19);
  v5 = v20;
  v6 = v21;
  __swift_project_boxed_opaque_existential_1(v19, v20);
  v7 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 48);
  v8 = v3;
  v9 = v7(v5, v6);
  LODWORD(v3) = v9;
  LODWORD(v5) = v10;
  LODWORD(v6) = v11;
  v13 = v12;
  v14 = HIDWORD(v9);
  v15 = HIDWORD(v10);
  v16 = HIDWORD(v11);
  v17 = HIDWORD(v12);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);

  retstr->var0[0] = v3;
  retstr->var0[1] = v14;
  retstr->var0[2] = v5;
  retstr->var0[3] = v15;
  retstr->var0[4] = v6;
  retstr->var0[5] = v16;
  retstr->var0[6] = v13;
  retstr->var0[7] = v17;
  return result;
}

@end
