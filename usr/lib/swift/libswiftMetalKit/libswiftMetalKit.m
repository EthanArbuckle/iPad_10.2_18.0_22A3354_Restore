void static MTKMesh.newMeshes(asset:device:)(uint64_t a1, uint64_t a2)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v11 = 0;
  v12[0] = 0;
  v2 = objc_msgSend((id)objc_opt_self(), sel_newMeshesFromAsset_device_sourceMeshes_error_, a1, a2, v12, &v11);
  v3 = v11;
  v4 = (void *)v12[0];
  if (v2)
  {
    v5 = v2;
    type metadata accessor for MTKMesh(0, &lazy cache variable for type metadata for MTKMesh);
    static Array._unconditionallyBridgeFromObjectiveC(_:)();
    v6 = v3;
    v7 = v4;

    if (v7)
    {
      v12[0] = 0;
      type metadata accessor for MTKMesh(0, &lazy cache variable for type metadata for MDLMesh);
      v8 = v7;
      static Array._forceBridgeFromObjectiveC(_:result:)();
      if (v12[0])
      {

        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
  else
  {
    v9 = v11;
    v10 = v4;
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
}

uint64_t type metadata accessor for MTKMesh(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

MDLVertexDescriptor __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> MTKModelIOVertexDescriptorFromMetalWithError(_:)(MTLVertexDescriptor a1)
{
  MDLVertexDescriptor *v1;
  NSError *v2;
  NSError *v4[2];

  v4[1] = *(NSError **)MEMORY[0x24BDAC8D0];
  v4[0] = 0;
  v1 = MTKModelIOVertexDescriptorFromMetalWithError((MTLVertexDescriptor *)a1.super.isa, v4);
  if (v4[0])
  {
    v2 = v4[0];
    swift_willThrow();

  }
  return (MDLVertexDescriptor)v1;
}

MTLVertexDescriptor_optional __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> MTKMetalVertexDescriptorFromModelIOWithError(_:)(MDLVertexDescriptor a1)
{
  Swift::Bool v1;
  MTLVertexDescriptor *v2;
  NSError *v3;
  objc_class *v4;
  NSError *v5[2];
  MTLVertexDescriptor_optional result;

  v5[1] = *(NSError **)MEMORY[0x24BDAC8D0];
  v5[0] = 0;
  v2 = MTKMetalVertexDescriptorFromModelIOWithError((MDLVertexDescriptor *)a1.super.isa, v5);
  if (v5[0])
  {
    v3 = v5[0];
    swift_willThrow();

  }
  v4 = (objc_class *)v2;
  result.value.super.isa = v4;
  result.is_nil = v1;
  return result;
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t static Array._forceBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x24BDCFBB0]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFBC8]();
}

MTLVertexDescriptor *__cdecl MTKMetalVertexDescriptorFromModelIOWithError(MDLVertexDescriptor *modelIODescriptor, NSError **error)
{
  return (MTLVertexDescriptor *)MEMORY[0x24BDDDAE0](modelIODescriptor, error);
}

MDLVertexDescriptor *__cdecl MTKModelIOVertexDescriptorFromMetalWithError(MTLVertexDescriptor *metalDescriptor, NSError **error)
{
  return (MDLVertexDescriptor *)MEMORY[0x24BDDDAE8](metalDescriptor, error);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

