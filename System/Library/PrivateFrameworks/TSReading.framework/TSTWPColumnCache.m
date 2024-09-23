@implementation TSTWPColumnCache

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = __Block_byref_object_copy__26;
  v13 = __Block_byref_object_dispose__26;
  v14 = 0;
  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = (objc_class *)objc_opt_class();
  v14 = objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p with %d key/value pairs \n{\n"), NSStringFromClass(v4), self, objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BEB3D20]), "count"));
  v5 = *(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x24BEB3D28]);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __31__TSTWPColumnCache_description__block_invoke;
  v8[3] = &unk_24D82EFF0;
  v8[4] = self;
  v8[5] = &v9;
  objc_msgSend(v5, "performSyncRead:", v8);
  objc_msgSend((id)v10[5], "appendString:", CFSTR("}>"));
  v6 = (void *)v10[5];
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __31__TSTWPColumnCache_description__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + (int)*MEMORY[0x24BEB3D20]);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __31__TSTWPColumnCache_description__block_invoke_2;
  v4[3] = &unk_24D82EFC8;
  v4[4] = v1;
  return objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v4);
}

uint64_t __31__TSTWPColumnCache_description__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  unsigned int v5;

  v5 = objc_msgSend(a2, "unsignedIntValue");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "appendFormat:", CFSTR("  { key: cellID   : %@\n"), objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%hu, %hu)"), v5, HIWORD(v5)));
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "appendFormat:", CFSTR("wpColumn:  object : %@\n           string : %@\n  },\n"), a3, objc_msgSend((id)objc_msgSend(a3, "storage"), "string"));
}

@end
