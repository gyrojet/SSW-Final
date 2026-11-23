using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Reflection.Emit;

namespace ProjectDbStarter.Models
{
    public class BowlingDbContext : DbContext
    {
        public BowlingDbContext(DbContextOptions<BowlingDbContext> options)
       : base(options)
        {
        }

        public DbSet<Team> Teams => Set<Team>();
        public DbSet<BowlingUser> Users => Set<BowlingUser>();

        // force singular table name
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Team>().ToTable("Team");
            modelBuilder.Entity<BowlingUser>().ToTable("BowlingUser");
        }
    }
}
