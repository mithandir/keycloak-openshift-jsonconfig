FROM jboss/keycloak-openshift:3.4.3.Final

ADD docker-entrypoint.sh /opt/jboss/
ADD userprofile /opt/jboss/keycloak/themes/userprofile/

ENTRYPOINT [ "openshift-entrypoint.sh" ]

CMD ["start-keycloak.sh", "-b", "0.0.0.0"]
