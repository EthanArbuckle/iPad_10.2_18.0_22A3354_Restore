@implementation SMBShare

- (SMBShare)init
{
  SMBShare *v2;
  SMBShare *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SMBShare;
  v2 = -[SMBShare init](&v5, sel_init);
  v3 = v2;
  if (v2 && pthread_mutex_init(&v2->statfs_lock, 0))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[SMBShare init].cold.1();

    return 0;
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  pthread_mutex_destroy(&self->statfs_lock);
  v3.receiver = self;
  v3.super_class = (Class)SMBShare;
  -[SMBShare dealloc](&v3, sel_dealloc);
}

- (void)statfs_lock
{
  pthread_mutex_lock(&self->statfs_lock);
}

- (void)statfs_unlock
{
  pthread_mutex_unlock(&self->statfs_lock);
}

- (unsigned)tree_id
{
  return self->_tree_id;
}

- (void)setTree_id:(unsigned int)a3
{
  self->_tree_id = a3;
}

- (unsigned)share_type
{
  return self->_share_type;
}

- (void)setShare_type:(unsigned int)a3
{
  self->_share_type = a3;
}

- (unsigned)share_capabilities
{
  return self->_share_capabilities;
}

- (void)setShare_capabilities:(unsigned int)a3
{
  self->_share_capabilities = a3;
}

- (unsigned)share_flags
{
  return self->_share_flags;
}

- (void)setShare_flags:(unsigned int)a3
{
  self->_share_flags = a3;
}

- (unsigned)share_max_access
{
  return self->_share_max_access;
}

- (void)setShare_max_access:(unsigned int)a3
{
  self->_share_max_access = a3;
}

- (NSString)sharename
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setSharename:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (unint64_t)total_alloc_units
{
  return self->_total_alloc_units;
}

- (void)setTotal_alloc_units:(unint64_t)a3
{
  self->_total_alloc_units = a3;
}

- (unint64_t)avail_alloc_units
{
  return self->_avail_alloc_units;
}

- (void)setAvail_alloc_units:(unint64_t)a3
{
  self->_avail_alloc_units = a3;
}

- (unsigned)sectors_per_alloc_unit
{
  return self->_sectors_per_alloc_unit;
}

- (void)setSectors_per_alloc_unit:(unsigned int)a3
{
  self->_sectors_per_alloc_unit = a3;
}

- (unsigned)bytes_per_sector
{
  return self->_bytes_per_sector;
}

- (void)setBytes_per_sector:(unsigned int)a3
{
  self->_bytes_per_sector = a3;
}

- (unsigned)fs_block_size
{
  return self->_fs_block_size;
}

- (void)setFs_block_size:(unsigned int)a3
{
  self->_fs_block_size = a3;
}

- (unint64_t)fs_iosize
{
  return self->_fs_iosize;
}

- (void)setFs_iosize:(unint64_t)a3
{
  self->_fs_iosize = a3;
}

- (unint64_t)fs_blocks
{
  return self->_fs_blocks;
}

- (void)setFs_blocks:(unint64_t)a3
{
  self->_fs_blocks = a3;
}

- (unint64_t)fs_blocks_free
{
  return self->_fs_blocks_free;
}

- (void)setFs_blocks_free:(unint64_t)a3
{
  self->_fs_blocks_free = a3;
}

- (unint64_t)fs_blocks_avail
{
  return self->_fs_blocks_avail;
}

- (void)setFs_blocks_avail:(unint64_t)a3
{
  self->_fs_blocks_avail = a3;
}

- (unint64_t)fs_files
{
  return self->_fs_files;
}

- (void)setFs_files:(unint64_t)a3
{
  self->_fs_files = a3;
}

- (unint64_t)fs_files_free
{
  return self->_fs_files_free;
}

- (void)setFs_files_free:(unint64_t)a3
{
  self->_fs_files_free = a3;
}

- (unsigned)file_system_attrs
{
  return self->_file_system_attrs;
}

- (void)setFile_system_attrs:(unsigned int)a3
{
  self->_file_system_attrs = a3;
}

- (unsigned)max_component_name_len
{
  return self->_max_component_name_len;
}

- (void)setMax_component_name_len:(unsigned int)a3
{
  self->_max_component_name_len = a3;
}

- (NSString)file_system_name
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (void)setFile_system_name:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (unsigned)fstype
{
  return self->_fstype;
}

- (void)setFstype:(unsigned int)a3
{
  self->_fstype = a3;
}

- (unsigned)isEncrypted
{
  return self->_isEncrypted;
}

- (void)setIsEncrypted:(unsigned int)a3
{
  self->_isEncrypted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_file_system_name, 0);
  objc_storeStrong((id *)&self->_sharename, 0);
}

- (void)init
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: pthread_mutex_init failed <%d> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

@end
