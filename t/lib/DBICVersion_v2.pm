package DBICVersion::Foo;

use base 'DBIx::Class::Core';
use strict;
use warnings;

__PACKAGE__->table('Foo');

__PACKAGE__->add_columns(
	foo => {
		data_type => 'INTEGER',
		is_auto_increment => 1,
	},
	bar => {
		data_type => 'VARCHAR',
		size => '10'
	},
	baz => {
		data_type => 'VARCHAR',
		size => '10',
		is_nullable => 1,
	},
);

__PACKAGE__->set_primary_key('foo');

package DBICVersion::Schema 2;
use base 'DBIx::Class::Schema';
use strict;
use warnings;

__PACKAGE__->register_class('Foo', 'DBICVersion::Foo');
__PACKAGE__->load_components('DeploymentHandler::VersionStorage::Standard::Component');

1;
