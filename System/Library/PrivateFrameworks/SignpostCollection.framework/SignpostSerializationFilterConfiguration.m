@implementation SignpostSerializationFilterConfiguration

- (SignpostSupportSubsystemCategoryFilter)subsystemCategoryFilter
{
  return self->_subsystemCategoryFilter;
}

- (void)setSubsystemCategoryFilter:(id)a3
{
  objc_storeStrong((id *)&self->_subsystemCategoryFilter, a3);
}

- (SignpostSupportPIDFilter)pidFilter
{
  return self->_pidFilter;
}

- (void)setPidFilter:(id)a3
{
  objc_storeStrong((id *)&self->_pidFilter, a3);
}

- (SignpostSupportUniquePIDFilter)uniquePidFilter
{
  return self->_uniquePidFilter;
}

- (void)setUniquePidFilter:(id)a3
{
  objc_storeStrong((id *)&self->_uniquePidFilter, a3);
}

- (SignpostSupportExactProcessNameFilter)processNameFilter
{
  return self->_processNameFilter;
}

- (void)setProcessNameFilter:(id)a3
{
  objc_storeStrong((id *)&self->_processNameFilter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processNameFilter, 0);
  objc_storeStrong((id *)&self->_uniquePidFilter, 0);
  objc_storeStrong((id *)&self->_pidFilter, 0);
  objc_storeStrong((id *)&self->_subsystemCategoryFilter, 0);
}

@end
