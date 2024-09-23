@implementation CEDeserialize

uint64_t __CEDeserialize_block_invoke(uint64_t result, _OWORD *a2)
{
  unint64_t v2;
  unint64_t v3;
  _OWORD *v4;
  __int128 v5;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  if (v2 >= *(_QWORD *)(result + 40))
  {
    result = (*(uint64_t (**)(_QWORD, const char *, ...))(**(_QWORD **)(result + 48) + 32))(**(_QWORD **)(result + 48), "[%s]: %s\n", "CEDeserialize_block_invoke", "CEDeserialization length mismatch");
  }
  else
  {
    v3 = *(_QWORD *)(result + 56);
    v4 = (_OWORD *)(v3 + 32 * v2);
    if ((unint64_t)v4 >= v3)
    {
      v5 = a2[1];
      *v4 = *a2;
      v4[1] = v5;
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
      return result;
    }
  }
  __break(0x5519u);
  return result;
}

@end
