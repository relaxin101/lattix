# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Lattix.Repo.insert!(%Lattix.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Lattix.Account.User
Lattix.Repo.insert!(User.registration_changeset(%User{}, %{ :name => "Alex", :email => "alex@example.com", :password => "asdf1234567890"}))

