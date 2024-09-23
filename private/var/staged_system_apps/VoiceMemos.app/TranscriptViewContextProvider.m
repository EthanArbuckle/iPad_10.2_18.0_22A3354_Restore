@implementation TranscriptViewContextProvider

- (void)willExpandTranscriptView
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  int v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const mach_header_64 *v16;

  v3 = *(_QWORD *)&self->context[8];
  v4 = self->context[16];
  v5 = self->context[17];
  v6 = self->context[18];
  v7 = self->context[19];
  v8 = self->context[20];
  v9 = *(double *)&self->context[24];
  self->context[17] = v5;
  self->context[18] = v6;
  self->context[19] = v7;
  self->context[20] = 1;
  v10 = *(unsigned __int16 *)self->context;
  sub_1000BED80(v3, v4);
  sub_1000BED80(v3, v4);
  sub_1000BED80(v3, v4);
  swift_retain(self);
  sub_1000BED94(v3, v4);
  v11 = 256;
  if (!v5)
    v11 = 0;
  v12 = v11 | v4;
  v13 = 0x10000;
  if (!v6)
    v13 = 0;
  v14 = 0x1000000;
  if (!v7)
    v14 = 0;
  v15 = v12 | v13 | v14;
  v16 = &_mh_execute_header;
  if (!v8)
    v16 = 0;
  sub_1000C3168(v10, v3, v15 | (unint64_t)v16, v9);
  sub_1000BED94(v3, v4);
  sub_1000BED94(v3, v4);
  swift_release(self);
}

- (void)willCollapseTranscriptView
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  int v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const mach_header_64 *v16;

  v3 = *(_QWORD *)&self->context[8];
  v4 = self->context[16];
  v5 = self->context[17];
  v6 = self->context[18];
  v7 = self->context[19];
  v8 = self->context[20];
  v9 = *(double *)&self->context[24];
  self->context[17] = v5;
  self->context[18] = v6;
  *(_WORD *)&self->context[19] = v7;
  v10 = *(unsigned __int16 *)self->context;
  sub_1000BED80(v3, v4);
  sub_1000BED80(v3, v4);
  sub_1000BED80(v3, v4);
  swift_retain(self);
  sub_1000BED94(v3, v4);
  v11 = 256;
  if (!v5)
    v11 = 0;
  v12 = v11 | v4;
  v13 = 0x10000;
  if (!v6)
    v13 = 0;
  v14 = 0x1000000;
  if (!v7)
    v14 = 0;
  v15 = v12 | v13 | v14;
  v16 = &_mh_execute_header;
  if (!v8)
    v16 = 0;
  sub_1000C3168(v10, v3, v15 | (unint64_t)v16, v9);
  sub_1000BED94(v3, v4);
  sub_1000BED94(v3, v4);
  swift_release(self);
}

- (void)didChangeHostViewWidth:(double)a3
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  int v8;
  int v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const mach_header_64 *v17;

  v4 = *(_QWORD *)&self->context[8];
  v5 = self->context[16];
  v6 = self->context[17];
  v7 = self->context[18];
  v8 = self->context[19];
  v9 = self->context[20];
  v10 = *(double *)&self->context[24];
  self->context[17] = v6;
  self->context[18] = v7;
  self->context[19] = v8;
  self->context[20] = v9;
  *(double *)&self->context[24] = a3;
  v11 = *(unsigned __int16 *)self->context;
  sub_1000BED80(v4, v5);
  sub_1000BED80(v4, v5);
  sub_1000BED80(v4, v5);
  swift_retain(self);
  sub_1000BED94(v4, v5);
  v12 = 256;
  if (!v6)
    v12 = 0;
  v13 = v12 | v5;
  v14 = 0x10000;
  if (!v7)
    v14 = 0;
  v15 = 0x1000000;
  if (!v8)
    v15 = 0;
  v16 = v13 | v14 | v15;
  v17 = &_mh_execute_header;
  if (!v9)
    v17 = 0;
  sub_1000C3168(v11, v4, v16 | (unint64_t)v17, v10);
  sub_1000BED94(v4, v5);
  sub_1000BED94(v4, v5);
  swift_release(self);
}

@end
