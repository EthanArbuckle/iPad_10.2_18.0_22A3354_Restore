uint64_t IWvA5fm4IwMS88oQXDANCS(int a1, int a2, uint64_t a3)
{
  unsigned int v3;
  uint64_t v5;
  unsigned int v6;
  int v7;
  unsigned int v8;

  if (a1 != 20 && a1 != 10)
    return 4294924545;
  v3 = 52583879 * ((((2 * &v5) | 0x4092578E) - &v5 - 541666247) ^ 0x12B1B613);
  v5 = a3;
  v8 = v3 ^ 0xFAF2A353;
  v6 = (a1 ^ 0xEBBDABFD) + ((2 * a1) & 0x577B57FA) + 1071841179 + v3;
  v7 = v3 ^ (a2 - ((2 * a2) & 0x20B7674) - 2130330822);
  nullsub_1(&v5);
  return 4294924587;
}

uint64_t JY0DfiUyFiVcNw89R4t(uint64_t a1)
{
  return (*(uint64_t (**)(void))((char *)&unk_402C + 8 * ((30 * (a1 != 0)) ^ 0xCu) - 12))();
}

uint64_t sub_F64(uint64_t a1)
{
  *(_QWORD *)a1 = 0x600000004;
  *(_DWORD *)(a1 + 8) = 0;
  return 0;
}

uint64_t sub_F7C()
{
  return 4294924596;
}
