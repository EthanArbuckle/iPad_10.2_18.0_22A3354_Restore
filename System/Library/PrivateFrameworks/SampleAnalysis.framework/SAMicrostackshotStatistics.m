@implementation SAMicrostackshotStatistics

- (SAMicrostackshotStatistics)init
{
  SAMicrostackshotStatistics *v2;
  SAMSTypeStats *v3;
  SAMSTypeStats *total;
  SAMSTypeStats *v5;
  SAMSTypeStats *interrupt;
  SAMSTypeStats *v7;
  SAMSTypeStats *timer;
  SAMSTypeStats *v9;
  SAMSTypeStats *io;
  SAMSTypeStats *v11;
  SAMSTypeStats *pmi;
  SAMSTypeStats *v13;
  SAMSTypeStats *macf;
  SAMSTypeStats *v15;
  SAMSTypeStats *unknown_type;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)SAMicrostackshotStatistics;
  v2 = -[SAMicrostackshotStatistics init](&v18, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SAMSTypeStats);
    total = v2->_total;
    v2->_total = v3;

    v5 = objc_alloc_init(SAMSTypeStats);
    interrupt = v2->_interrupt;
    v2->_interrupt = v5;

    v7 = objc_alloc_init(SAMSTypeStats);
    timer = v2->_timer;
    v2->_timer = v7;

    v9 = objc_alloc_init(SAMSTypeStats);
    io = v2->_io;
    v2->_io = v9;

    v11 = objc_alloc_init(SAMSTypeStats);
    pmi = v2->_pmi;
    v2->_pmi = v11;

    v13 = objc_alloc_init(SAMSTypeStats);
    macf = v2->_macf;
    v2->_macf = v13;

    v15 = objc_alloc_init(SAMSTypeStats);
    unknown_type = v2->_unknown_type;
    v2->_unknown_type = v15;

  }
  return v2;
}

- (_QWORD)addMicro:(uint64_t)a3 task:(uint64_t)a4 thread:(uint64_t)a5 size:(uint64_t)a6 errors:
{
  _QWORD **v11;
  char v12;

  if (result)
  {
    v11 = (_QWORD **)result;
    result = -[SAMSTypeStats addTask:thread:size:errors:]((_QWORD *)result[1], a3, a4, a5, a6);
    v12 = *(_BYTE *)(a2 + 24);
    if ((v12 & 1) != 0)
    {
      result = -[SAMSTypeStats addTask:thread:size:errors:](v11[2], a3, a4, a5, a6);
      v12 = *(_BYTE *)(a2 + 24);
      if ((v12 & 2) == 0)
      {
LABEL_4:
        if ((v12 & 8) == 0)
          goto LABEL_5;
        goto LABEL_12;
      }
    }
    else if ((*(_BYTE *)(a2 + 24) & 2) == 0)
    {
      goto LABEL_4;
    }
    result = -[SAMSTypeStats addTask:thread:size:errors:](v11[3], a3, a4, a5, a6);
    v12 = *(_BYTE *)(a2 + 24);
    if ((v12 & 8) == 0)
    {
LABEL_5:
      if ((v12 & 0x10) == 0)
        goto LABEL_6;
      goto LABEL_13;
    }
LABEL_12:
    result = -[SAMSTypeStats addTask:thread:size:errors:](v11[4], a3, a4, a5, a6);
    v12 = *(_BYTE *)(a2 + 24);
    if ((v12 & 0x10) == 0)
    {
LABEL_6:
      if ((v12 & 0x20) == 0)
        goto LABEL_8;
      goto LABEL_7;
    }
LABEL_13:
    result = -[SAMSTypeStats addTask:thread:size:errors:](v11[5], a3, a4, a5, a6);
    v12 = *(_BYTE *)(a2 + 24);
    if ((v12 & 0x20) == 0)
    {
LABEL_8:
      if ((v12 & 0x3B) == 0)
        return -[SAMSTypeStats addTask:thread:size:errors:](v11[7], a3, a4, a5, a6);
      return result;
    }
LABEL_7:
    result = -[SAMSTypeStats addTask:thread:size:errors:](v11[6], a3, a4, a5, a6);
    v12 = *(_BYTE *)(a2 + 24);
    goto LABEL_8;
  }
  return result;
}

- (id)debugDescription
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t num_microstackshots_filtered_out;
  unint64_t bytes_not_microstackshots;
  unint64_t v67;
  void *v68;

  v68 = (void *)MEMORY[0x1E0CB3940];
  v3 = -[SAMSTypeStats bytes](self->_total, "bytes");
  v4 = -[SAMSTypeStats bytes_duplicate](self->_total, "bytes_duplicate") + v3;
  v5 = -[SAMSTypeStats bytes_out_of_order](self->_total, "bytes_out_of_order");
  v6 = -[SAMSTypeStats bytes_missing_load_info](self->_total, "bytes_missing_load_info");
  num_microstackshots_filtered_out = self->_num_microstackshots_filtered_out;
  bytes_not_microstackshots = self->_bytes_not_microstackshots;
  v67 = v4 + v5 + v6 + bytes_not_microstackshots;
  v64 = -[SAMSTypeStats count](self->_total, "count");
  v63 = -[SAMSTypeStats bytes](self->_total, "bytes");
  v62 = -[SAMSTypeStats num_load_infos](self->_total, "num_load_infos");
  v61 = -[SAMSTypeStats num_frames](self->_total, "num_frames");
  v60 = -[SAMSTypeStats num_duplicate](self->_total, "num_duplicate");
  v59 = -[SAMSTypeStats bytes_duplicate](self->_total, "bytes_duplicate");
  v58 = -[SAMSTypeStats num_out_of_order](self->_total, "num_out_of_order");
  v57 = -[SAMSTypeStats bytes_out_of_order](self->_total, "bytes_out_of_order");
  v56 = -[SAMSTypeStats num_missing_load_info](self->_total, "num_missing_load_info");
  v55 = -[SAMSTypeStats bytes_missing_load_info](self->_total, "bytes_missing_load_info");
  v54 = -[SAMSTypeStats count](self->_interrupt, "count");
  v53 = -[SAMSTypeStats bytes](self->_interrupt, "bytes");
  v52 = -[SAMSTypeStats num_load_infos](self->_interrupt, "num_load_infos");
  v51 = -[SAMSTypeStats num_frames](self->_interrupt, "num_frames");
  v50 = -[SAMSTypeStats num_duplicate](self->_interrupt, "num_duplicate");
  v49 = -[SAMSTypeStats bytes_duplicate](self->_interrupt, "bytes_duplicate");
  v48 = -[SAMSTypeStats num_out_of_order](self->_interrupt, "num_out_of_order");
  v47 = -[SAMSTypeStats bytes_out_of_order](self->_interrupt, "bytes_out_of_order");
  v46 = -[SAMSTypeStats num_missing_load_info](self->_interrupt, "num_missing_load_info");
  v45 = -[SAMSTypeStats bytes_missing_load_info](self->_interrupt, "bytes_missing_load_info");
  v44 = -[SAMSTypeStats count](self->_timer, "count");
  v43 = -[SAMSTypeStats bytes](self->_timer, "bytes");
  v42 = -[SAMSTypeStats num_load_infos](self->_timer, "num_load_infos");
  v41 = -[SAMSTypeStats num_frames](self->_timer, "num_frames");
  v40 = -[SAMSTypeStats num_duplicate](self->_timer, "num_duplicate");
  v39 = -[SAMSTypeStats bytes_duplicate](self->_timer, "bytes_duplicate");
  v38 = -[SAMSTypeStats num_out_of_order](self->_timer, "num_out_of_order");
  v37 = -[SAMSTypeStats bytes_out_of_order](self->_timer, "bytes_out_of_order");
  v36 = -[SAMSTypeStats num_missing_load_info](self->_timer, "num_missing_load_info");
  v35 = -[SAMSTypeStats bytes_missing_load_info](self->_timer, "bytes_missing_load_info");
  v34 = -[SAMSTypeStats count](self->_io, "count");
  v33 = -[SAMSTypeStats bytes](self->_io, "bytes");
  v32 = -[SAMSTypeStats num_load_infos](self->_io, "num_load_infos");
  v31 = -[SAMSTypeStats num_frames](self->_io, "num_frames");
  v30 = -[SAMSTypeStats num_duplicate](self->_io, "num_duplicate");
  v29 = -[SAMSTypeStats bytes_duplicate](self->_io, "bytes_duplicate");
  v28 = -[SAMSTypeStats num_out_of_order](self->_io, "num_out_of_order");
  v27 = -[SAMSTypeStats bytes_out_of_order](self->_io, "bytes_out_of_order");
  v26 = -[SAMSTypeStats num_missing_load_info](self->_io, "num_missing_load_info");
  v25 = -[SAMSTypeStats bytes_missing_load_info](self->_io, "bytes_missing_load_info");
  v24 = -[SAMSTypeStats count](self->_pmi, "count");
  v23 = -[SAMSTypeStats bytes](self->_pmi, "bytes");
  v22 = -[SAMSTypeStats num_load_infos](self->_pmi, "num_load_infos");
  v21 = -[SAMSTypeStats num_frames](self->_pmi, "num_frames");
  v20 = -[SAMSTypeStats num_duplicate](self->_pmi, "num_duplicate");
  v19 = -[SAMSTypeStats bytes_duplicate](self->_pmi, "bytes_duplicate");
  v18 = -[SAMSTypeStats num_out_of_order](self->_pmi, "num_out_of_order");
  v17 = -[SAMSTypeStats bytes_out_of_order](self->_pmi, "bytes_out_of_order");
  v16 = -[SAMSTypeStats num_missing_load_info](self->_pmi, "num_missing_load_info");
  v15 = -[SAMSTypeStats bytes_missing_load_info](self->_pmi, "bytes_missing_load_info");
  v14 = -[SAMSTypeStats count](self->_macf, "count");
  v13 = -[SAMSTypeStats bytes](self->_macf, "bytes");
  v12 = -[SAMSTypeStats num_load_infos](self->_macf, "num_load_infos");
  v11 = -[SAMSTypeStats num_frames](self->_macf, "num_frames");
  v10 = -[SAMSTypeStats num_duplicate](self->_macf, "num_duplicate");
  v9 = -[SAMSTypeStats bytes_duplicate](self->_macf, "bytes_duplicate");
  v8 = -[SAMSTypeStats num_out_of_order](self->_macf, "num_out_of_order");
  -[SAMSTypeStats bytes_out_of_order](self->_macf, "bytes_out_of_order");
  -[SAMSTypeStats num_missing_load_info](self->_macf, "num_missing_load_info");
  -[SAMSTypeStats bytes_missing_load_info](self->_macf, "bytes_missing_load_info");
  -[SAMSTypeStats count](self->_unknown_type, "count");
  -[SAMSTypeStats bytes](self->_unknown_type, "bytes");
  -[SAMSTypeStats num_load_infos](self->_unknown_type, "num_load_infos");
  -[SAMSTypeStats num_frames](self->_unknown_type, "num_frames");
  -[SAMSTypeStats num_duplicate](self->_unknown_type, "num_duplicate");
  -[SAMSTypeStats bytes_duplicate](self->_unknown_type, "bytes_duplicate");
  -[SAMSTypeStats num_out_of_order](self->_unknown_type, "num_out_of_order");
  -[SAMSTypeStats bytes_out_of_order](self->_unknown_type, "bytes_out_of_order");
  -[SAMSTypeStats num_missing_load_info](self->_unknown_type, "num_missing_load_info");
  -[SAMSTypeStats bytes_missing_load_info](self->_unknown_type, "bytes_missing_load_info");
  return (id)objc_msgSend(v68, "stringWithFormat:", CFSTR("Microstackshot statistics:\n%llu bytes parsed (%llu bytes invalid)\n%llu filtered out\n\ntotal     count          %llu (%llu bytes)\n          num_load_infos %llu\n          num_frames     %llu\n          duplicate      %llu (%llu bytes)\n          out_of_order   %llu (%llu bytes)\n          no_load_info   %llu (%llu bytes)\n\ninterrupt count          %llu (%llu bytes)\n          num_load_infos %llu\n          num_frames     %llu\n          duplicate      %llu (%llu bytes)\n          out_of_order   %llu (%llu bytes)\n          no_load_info   %llu (%llu bytes)\n\ntimer     count          %llu (%llu bytes)\n          num_load_infos %llu\n          num_frames     %llu\n          duplicate      %llu (%llu bytes)\n          out_of_order   %llu (%llu bytes)\n          no_load_info   %llu (%llu bytes)\n\nio        count          %llu (%llu bytes)\n          num_load_infos %llu\n          num_frames     %llu\n          duplicate      %llu (%llu bytes)\n          out_of_order   %llu (%llu bytes)\n          no_load_info   %llu (%llu bytes)\n\npmi       count          %llu (%llu bytes)\n          num_load_infos %llu\n          num_frames     %llu\n          duplicate      %llu (%llu bytes)\n          out_of_order   %llu (%llu bytes)\n          no_load_info   %llu (%llu bytes)\n\nmacf      count          %llu (%llu bytes)\n          num_load_infos %llu\n          num_frames     %llu\n          duplicate      %llu (%llu bytes)\n          out_of_order   %llu (%llu bytes)\n          no_load_info   %llu (%llu bytes)\n\nunknown   count          %llu (%llu bytes)\n          num_load_infos %llu\n          num_frames     %llu\n          duplicate      %llu (%llu bytes)\n          out_of_order   %llu (%llu bytes)\n          no_load_info   %llu (%llu bytes)"), v67, bytes_not_microstackshots, num_microstackshots_filtered_out, v64, v63, v62, v61, v60, v59, v58, v57, v56, v55, v54, v53, v52,
               v51,
               v50,
               v49,
               v48,
               v47,
               v46,
               v45,
               v44,
               v43,
               v42,
               v41,
               v40,
               v39,
               v38,
               v37,
               v36,
               v35,
               v34,
               v33,
               v32,
               v31,
               v30,
               v29,
               v28,
               v27,
               v26,
               v25,
               v24,
               v23,
               v22,
               v21,
               v20,
               v19,
               v18,
               v17,
               v16,
               v15,
               v14,
               v13,
               v12,
               v11,
               v10,
               v9,
               v8);
}

- (SAMSTypeStats)total
{
  return (SAMSTypeStats *)objc_getProperty(self, a2, 8, 1);
}

- (SAMSTypeStats)interrupt
{
  return (SAMSTypeStats *)objc_getProperty(self, a2, 16, 1);
}

- (SAMSTypeStats)timer
{
  return (SAMSTypeStats *)objc_getProperty(self, a2, 24, 1);
}

- (SAMSTypeStats)io
{
  return (SAMSTypeStats *)objc_getProperty(self, a2, 32, 1);
}

- (SAMSTypeStats)pmi
{
  return (SAMSTypeStats *)objc_getProperty(self, a2, 40, 1);
}

- (SAMSTypeStats)macf
{
  return (SAMSTypeStats *)objc_getProperty(self, a2, 48, 1);
}

- (SAMSTypeStats)unknown_type
{
  return (SAMSTypeStats *)objc_getProperty(self, a2, 56, 1);
}

- (unint64_t)bytes_not_microstackshots
{
  return self->_bytes_not_microstackshots;
}

- (void)setBytes_not_microstackshots:(unint64_t)a3
{
  self->_bytes_not_microstackshots = a3;
}

- (unint64_t)num_microstackshots_filtered_out
{
  return self->_num_microstackshots_filtered_out;
}

- (void)setNum_microstackshots_filtered_out:(unint64_t)a3
{
  self->_num_microstackshots_filtered_out = a3;
}

- (unint64_t)bytes_microstackshots_filtered_out
{
  return self->_bytes_microstackshots_filtered_out;
}

- (void)setBytes_microstackshots_filtered_out:(unint64_t)a3
{
  self->_bytes_microstackshots_filtered_out = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknown_type, 0);
  objc_storeStrong((id *)&self->_macf, 0);
  objc_storeStrong((id *)&self->_pmi, 0);
  objc_storeStrong((id *)&self->_io, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_interrupt, 0);
  objc_storeStrong((id *)&self->_total, 0);
}

@end
